










import Proving.TitleIIEnf.Predicates

namespace Proving.TitleIIEnf








structure ThreeJudgeTrack
    (pr : Proceeding) (d : Designation) (c : ComplaintText) : Prop where
  pending        : PendingEnforcementProceeding pr c
  agRequested    : AGRequestedThreeJudgeCourt pr c
  certificate    : AccompaniedByPublicImportanceCertificate pr c
  furnishedChief : RequestFurnishedToChiefJudge pr c
  designated     : ThreeJudgesDesignated d pr c
  composition    : PanelCompositionProper d c
  expedited      : CaseExpeditedAtEarliestDate pr c
  scotusAppeal   : AppealLiesToSupremeCourt pr c








structure SingleJudgeFallbackTrack
    (pr : Proceeding) (d : Designation) (c : ComplaintText) : Prop where
  pending      : PendingEnforcementProceeding pr c
  agNoRequest  : AGDidNotRequestThreeJudgeCourt pr c
  designated   : DistrictChiefDesignatedSingleJudge d pr c
  expedited    : CaseExpeditedAtEarliestDate pr c



inductive ValidSection2000a5bConvening
    (pr : Proceeding) (c : ComplaintText) : Prop where
  | viaThreeJudge
      (d : Designation)
      (h : ThreeJudgeTrack pr d c) :
      ValidSection2000a5bConvening pr c
  | viaSingleJudgeFallback
      (d : Designation)
      (h : SingleJudgeFallbackTrack pr d c) :
      ValidSection2000a5bConvening pr c

end Proving.TitleIIEnf
