import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Types





namespace Proving.USC.T42.PublicAccommodations.Enforcement.Elements

open Proving.USC.Common







axiom IsPersonOrGroup (r : Respondent) (c : ComplaintText) : Prop




axiom EngagedInPatternOrPracticeOfResistance (r : Respondent) (c : ComplaintText) : Prop




axiom IntendedToDenyFullExercise (r : Respondent) (c : ComplaintText) : Prop



axiom ComplaintSignedByAttorneyGeneral (a : Actor) (cpl : Complaint) (c : ComplaintText) : Prop



axiom ComplaintSetsForthPatternFacts (cpl : Complaint) (c : ComplaintText) : Prop




axiom ComplaintRequestsPreventiveRelief (cpl : Complaint) (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt (cpl : Complaint) (c : ComplaintText) : Prop








axiom ThreeJudgeRequestFiledWithClerk (a : Actor) (c : ComplaintText) : Prop




axiom CertifiedGeneralPublicImportance (a : Actor) (c : ComplaintText) : Prop









axiom ComplaintReferredByCourt (a : Actor) (c : ComplaintText) : Prop



axiom HearingsInExecutiveSession (a : Actor) (c : ComplaintText) : Prop




axiom TestimonyWithheldAbsentAgreement (a : Actor) (c : ComplaintText) : Prop



axiom EndeavorsVoluntarySettlement (a : Actor) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Enforcement.Elements
