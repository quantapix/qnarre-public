import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Statute



namespace Proving.USC.T42.PublicAccommodations.Enforcement.Elements

open Proving.USC.Common

theorem section2000a5a_intro {a r cpl c}
    (hPOG : IsPersonOrGroup r c)
    (hPOP : EngagedInPatternOrPracticeOfResistance r c)
    (hInt : IntendedToDenyFullExercise r c)
    (hSig : ComplaintSignedByAttorneyGeneral a cpl c)
    (hFacts : ComplaintSetsForthPatternFacts cpl c)
    (hRel : ComplaintRequestsPreventiveRelief cpl c)
    (hForum : FiledInAppropriateDistrictCourt cpl c) :
    Section2000a5a a r cpl c :=
  ⟨hPOG, hPOP, hInt, hSig, hFacts, hRel, hForum⟩

theorem section2000a5b_intro {a c}
    (hReq : ThreeJudgeRequestFiledWithClerk a c)
    (hPub : CertifiedGeneralPublicImportance a c) :
    Section2000a5b a c :=
  ⟨hReq, hPub⟩

theorem section2000a4_intro {a c}
    (hRef : ComplaintReferredByCourt a c)
    (hExec : HearingsInExecutiveSession a c)
    (hWith : TestimonyWithheldAbsentAgreement a c)
    (hSettle : EndeavorsVoluntarySettlement a c) :
    Section2000a4 a c :=
  ⟨hRef, hExec, hWith, hSettle⟩


theorem validAttorneyGeneralEnforcement_singleJudge_intro {a r cpl c}
    (h : Section2000a5a a r cpl c) :
    ValidAttorneyGeneralEnforcement a r cpl c :=
  .singleJudge h


theorem validAttorneyGeneralEnforcement_threeJudge_intro {a r cpl c}
    (h : Section2000a5a a r cpl c) (hb : Section2000a5b a c) :
    ValidAttorneyGeneralEnforcement a r cpl c :=
  .threeJudge h hb

end Proving.USC.T42.PublicAccommodations.Enforcement.Elements
