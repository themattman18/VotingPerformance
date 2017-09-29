using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Numerics;  // To us BigIntegers it is necessary to add a reference.
// See link: http://stackoverflow.com/questions/9824479/how-to-add-a-reference-do-system-numerics-dll                    


/// <summary>
/// This class is primarily intended for use of verifying individual votes and collections of votes 
/// generally using 16 digit numbers as checksums.
/// </summary> 
public class VerificationNumber
{
    // Public static data.
    private static Random random = new Random();

    // Public static methods.

    /// <summary>
    /// Generates an election addend for voter or candidate.
    ///  Note if you want a string value returned simply append the ToString method to the method call.
    /// </summary>
    /// <returns></returns>
    public static BigInteger getRandomAddend()
    {
        long sum = 0;
        for (int position = 0; position < 16; position++)
        {
            sum += random.Next(0, 10) * (long) Math.Pow(10, position);
        }        
        return (new BigInteger(sum));
    }

    /// <summary>
    /// Creates a checksum for an individual vote.
    /// </summary>
    /// <param name="voteAddend"></param>
    /// <param name="candidateAddend"></param>
    /// <returns></returns>
    public static BigInteger checkSumVote(BigInteger voteAddend, BigInteger candidateAddend)
    {        
        return crossMultiplyCheckSum(voteAddend, candidateAddend);
    }
 
    /// <summary>
    /// Creates a checksum as a running total for each voted in order to maintain integrity for an election's 
    /// entire collection of votes.
    /// </summary>
    /// <param name="voteAddend"></param>
    /// <param name="candidateAddend"></param>
    /// <returns></returns>
    public static BigInteger checkSumElection(BigInteger voteAddend, BigInteger candidateAddend)
    {
        return (voteAddend + candidateAddend) % 10000000000000000;    // Sum values and reduce to 16 digits if necessary.
    }

    /// <summary>
    /// Reset the random object with a new seed value.
    /// </summary>
    public static void seedRandomGenerator()
    {
        //Guid.NewGuid().GetHashCode()
        //random = new Random(Guid.NewGuid().GetHashCode());
        //new Random(BitConverter.ToInt32(Guid.NewGuid().ToByteArray(), 0));
        //int test = unchecked(DateTime.Now.Ticks.GetHashCode());
        //System.Console.Write(test);
        //random = new Random(unchecked(DateTime.Now.Ticks.GetHashCode()));
        //random = new Random(test);
    }

    // Note: To convert from string to BigInteger: BigInteger.Parse("1234567890123456")
    // Note: To convert from BigInteger to string: myBigInteger.ToString()
    
    // Instance data.
    public BigInteger ERROR = -1, UNASSIGNED = -2;

    // Property with private variable for the numeric value of the object.
    private BigInteger number;  
    public BigInteger Number
    {
        get { return number; }
        set
        {
            if ((value >= 0) || (value == UNASSIGNED))
            {
                number = value;
            }
            else
            {
                number = ERROR;
            }
        }
    }

    // Constructors and ToString method.
	public VerificationNumber()
	{
        Number = UNASSIGNED;		
	}

    public VerificationNumber(BigInteger n)
    {
        Number = n;
    }

    public VerificationNumber(long n)
    {
        Number = n;
    }

    public VerificationNumber(int n)
    {
        Number = n;
    }

    public override string ToString()
    {
        return Number.ToString();
    }

    // Private static methods.
    private static BigInteger middleDigits(BigInteger allDigits, int span)
    {
        int length = getLength(allDigits);
        int low = (length - span) / 2;
        BigInteger middleValue = getDigits(allDigits, low, low + span - 1);
        return middleValue;
    }

    private static int getLength(BigInteger theNumber)
    {
        int length = 0;
        while (theNumber > 0)
        {
            theNumber /= 10;
            length++;
        }
        return length;
    }
    
    private static BigInteger getDigits(BigInteger theNumber, int low, int high)
    {
        // Isolate digits from the number.
        BigInteger digits = theNumber % BigInteger.Pow(10, high + 1);  // Remove higher digits.
        digits /= BigInteger.Pow(10, low);                          // Remover lower digits.
        return digits;
    }

    // Inserts digits into the number.
    private static void putDigits(BigInteger target, BigInteger newDigits, int low, int high)
    {
        // Get the number that only has the old digits that need replacing. 
        BigInteger oldDigitsValue = getDigits(target, low, high) * BigInteger.Pow(10, low);
        // Get the number for only the new digits that need adding.
        BigInteger newDigitsValue = newDigits * BigInteger.Pow(10, low);
        // Update number with new digits.
        target = target - oldDigitsValue + newDigitsValue;
    }

    private static BigInteger multiply(BigInteger firstBI, int firstLow, int firstHigh,
            BigInteger secondBI, int secondLow, int secondHigh)
    {
        BigInteger first = getDigits(firstBI, firstLow, firstHigh),
                    second = getDigits(secondBI, secondLow, secondHigh);
        return (first * second + first + second);   // The adds preserve the equal distribution of odd and even numbers.
    }

    private static BigInteger multiply(BigInteger firstBI, BigInteger secondBI)
    {
        return (firstBI * secondBI + firstBI + secondBI);   // The adds preserve the equal distribution of odd and even numbers.
    }

    private static BigInteger crossMultiplyCheckSum(BigInteger firstBI, BigInteger secondBI)
    {        
        // Copy values for use in computing "cross-multiplication." 
        BigInteger first = firstBI, second = secondBI;

        // Cross multiply all sets of four digits and transform first and second accordingly.
        digitTransformation(first, second, 4);

        // Cross multiply all sets of eight digits and transform first and second accordingly.
        digitTransformation(first, second, 8);
 
        // Cross multiply the full 16 digits and return middle digits for final checksum value.        
        return middleDigits(multiply(first, second), 16);
    }

    private static void digitTransformation(BigInteger first, BigInteger second, int setSize)
    {
        // Cross multiply all sets while interleaving updates. 
        int sets = 16 / setSize;                // Determine the number of sets based on setSize.
        for (int set = 0; set < sets; set++)    // Loop through all sets to obtain grand sum of all multiplications.
        {
            // Transform all sets in first with the result.
            BigInteger  firstFactor = getDigits(first, set * setSize, (set + 1) * setSize - 1),             // Get first factor from first.
                        secondFactor,
                        result = 0;
            for (int secondSet = 0; secondSet < sets; secondSet++)
            {
                secondFactor = getDigits(second, secondSet * setSize, (secondSet + 1) * setSize - 1);       // Get second factors from second.                
                result += multiply(firstFactor, secondFactor);                                              // Multiply and accumulate products.                
            }
            result = middleDigits(result, setSize);                                                         // Get final result from middle digits.
            putDigits(first, result, set * setSize, (set + 1) * setSize - 1);                               // Put new digits into their proper position in first.

            // Transform all sets in second with the result.
            secondFactor = getDigits(second, set * setSize, (set + 1) * setSize - 1);                        // Get second factor from second.
            result = 0;
            for (int firstSet = 0; firstSet < sets; firstSet++)
            {
                firstFactor = getDigits(first, firstSet * setSize, (firstSet + 1) * setSize - 1);           // Get first factors from first.                
                result += multiply(firstFactor, secondFactor);                                              // Multiply and accumulate products.                
            }
            result = middleDigits(result, setSize);                                                         // Get final result from middle digits.
            putDigits(second, result, set * setSize, (set + 1) * setSize - 1);                              // Put new digits into their proper position in second.
        }
    }

}