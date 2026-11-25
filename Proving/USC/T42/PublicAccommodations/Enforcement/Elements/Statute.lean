import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Predicates



namespace Proving.USC.T42.PublicAccommodations.Enforcement.Elements

open Proving.USC.Common



structure Section2000a5a (a : Actor) (r : Respondent) (cpl : Complaint) (c : ComplaintText) : Prop where
  personOrGroup     : IsPersonOrGroup r c
  patternOrPractice : EngagedInPatternOrPracticeOfResistance r c
  intent            : IntendedToDenyFullExercise r c
  signed            : ComplaintSignedByAttorneyGeneral a cpl c
  pleadsFacts       : ComplaintSetsForthPatternFacts cpl c
  requestsRelief    : ComplaintRequestsPreventiveRelief cpl c
  federalForum      : FiledInAppropriateDistrictCourt cpl c



structure Section2000a5b (a : Actor) (c : ComplaintText) : Prop where
  requestFiled      : ThreeJudgeRequestFiledWithClerk a c
  publicImportance  : CertifiedGeneralPublicImportance a c



structure Section2000a4 (a : Actor) (c : ComplaintText) : Prop where
  referred          : ComplaintReferredByCourt a c
  executiveSession  : HearingsInExecutiveSession a c
  testimonyWithheld : TestimonyWithheldAbsentAgreement a c
  endeavorsSettle   : EndeavorsVoluntarySettlement a c



inductive ValidAttorneyGeneralEnforcement
    (a : Actor) (r : Respondent) (cpl : Complaint) (c : ComplaintText) : Prop where

  | singleJudge (h : Section2000a5a a r cpl c) :
      ValidAttorneyGeneralEnforcement a r cpl c

  | threeJudge (h : Section2000a5a a r cpl c) (hb : Section2000a5b a c) :
      ValidAttorneyGeneralEnforcement a r cpl c

end Proving.USC.T42.PublicAccommodations.Enforcement.Elements
