var Election = {

    Data: {
        CastVoteUrl: "",
        ElectionID: 0,
    },

    //**********************************************************************
    //*                  Casts a vote for a candidate                      *
    //**********************************************************************
    CastVote: function(candidateID) {
        window.location = Election.Data.CastVoteUrl + "?candidateID=" + candidateID + "&electionID=" + Election.Data.ElectionID;
    }
}