//**********************************************************************
//*                  Opens an election in a new tab                    *
//**********************************************************************
function GoToElection(electionID) {
    var electionUrl = $("#actionData").attr("data-election-url");
    window.location = electionUrl + "?electionID=" + electionID;
}