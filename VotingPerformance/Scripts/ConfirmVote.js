
var ConfirmVote = {
    Data: {
        CastVoteUrl: "",
        AuthToken: null
    },

    //**********************************************************************
    //*                  Casts a vote for a candidate                      *
    //**********************************************************************
    CastVote: function () {
        window.location = ConfirmVote.Data.CastVoteUrl + "?voteAuthToken=" + ConfirmVote.Data.AuthToken;
    }
}