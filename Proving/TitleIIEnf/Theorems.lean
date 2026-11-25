














import Proving.TitleIIEnf.Statute

namespace Proving.TitleIIEnf



theorem threeJudgeTrack_intro
    {pr : Proceeding} {d : Designation} {c : ComplaintText}
    (hPending        : PendingEnforcementProceeding pr c)
    (hAGRequested    : AGRequestedThreeJudgeCourt pr c)
    (hCertificate    : AccompaniedByPublicImportanceCertificate pr c)
    (hFurnishedChief : RequestFurnishedToChiefJudge pr c)
    (hDesignated     : ThreeJudgesDesignated d pr c)
    (hComposition    : PanelCompositionProper d c)
    (hExpedited      : CaseExpeditedAtEarliestDate pr c)
    (hScotusAppeal   : AppealLiesToSupremeCourt pr c)
    : ThreeJudgeTrack pr d c :=
  { pending := hPending
    agRequested := hAGRequested
    certificate := hCertificate
    furnishedChief := hFurnishedChief
    designated := hDesignated
    composition := hComposition
    expedited := hExpedited
    scotusAppeal := hScotusAppeal }

theorem singleJudgeFallbackTrack_intro
    {pr : Proceeding} {d : Designation} {c : ComplaintText}
    (hPending     : PendingEnforcementProceeding pr c)
    (hAGNoRequest : AGDidNotRequestThreeJudgeCourt pr c)
    (hDesignated  : DistrictChiefDesignatedSingleJudge d pr c)
    (hExpedited   : CaseExpeditedAtEarliestDate pr c)
    : SingleJudgeFallbackTrack pr d c :=
  { pending := hPending
    agNoRequest := hAGNoRequest
    designated := hDesignated
    expedited := hExpedited }



theorem validSection2000a5bConvening_ofThreeJudge
    {pr : Proceeding} {d : Designation} {c : ComplaintText}
    (h : ThreeJudgeTrack pr d c)
    : ValidSection2000a5bConvening pr c :=
  ValidSection2000a5bConvening.viaThreeJudge d h

theorem validSection2000a5bConvening_ofSingleJudgeFallback
    {pr : Proceeding} {d : Designation} {c : ComplaintText}
    (h : SingleJudgeFallbackTrack pr d c)
    : ValidSection2000a5bConvening pr c :=
  ValidSection2000a5bConvening.viaSingleJudgeFallback d h

end Proving.TitleIIEnf
