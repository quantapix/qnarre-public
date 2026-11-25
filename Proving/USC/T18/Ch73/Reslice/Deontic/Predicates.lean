




import Proving.USC.T18.Ch73.Reslice.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Deontic

open Proving.USC.Common







axiom IsPersonSubjectToSection1512 (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesAsProsecutor1512 (e : Entity) (c : ComplaintText) : Prop




axiom IsSentencingCourt1512j (e : Entity) (c : ComplaintText) : Prop






axiom KillsOrAttemptsToKill1512a1 (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom UsesOrThreatensPhysicalForce1512a2 (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom UsesIntimidationOrThreatens1512b (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom CorruptlyAltersDestroysOrConceals1512c1
    (p : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom CorruptlyObstructsOfficialProceeding1512c2
    (p : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom IntentionallyHarasses1512d (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom ConspiresToCommitSection1512Offense1512k (p : Person) (c : ComplaintText) : Prop








axiom MaximumTermSetToHigherAlternative1512j
    (e : Entity) (p : Person) (k : CriminalCase) (c : ComplaintText) : Prop




axiom ProsecutionBroughtInDistrict1512i
    (e : Entity) (d : District) (c : ComplaintText) : Prop








axiom IntentToPreventOrInfluenceTestimonyOrEvidence1512
    (p : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop






axiom IntentToInduceWitnessNoncompliance1512
    (p : Person) (v : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop










axiom IntentToHinderLawEnforcementCommunication1512
    (p : Person) (o : Person) (c : ComplaintText) : Prop




axiom IntentToImpairObjectIntegrity1512c1
    (p : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop






axiom ActedKnowingly1512b (p : Person) (c : ComplaintText) : Prop




axiom ActedCorruptly1512c (p : Person) (c : ComplaintText) : Prop




axiom ActedIntentionally1512d (p : Person) (c : ComplaintText) : Prop







axiom HarassmentCausedDissuasion1512d (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom DissuadedFromAttendingOrTestifying1512d1 (v : Person) (c : ComplaintText) : Prop








axiom DissuadedFromReportingToLawEnforcement1512d2 (v : Person) (c : ComplaintText) : Prop





axiom DissuadedFromSeekingArrest1512d3 (v : Person) (c : ComplaintText) : Prop





axiom DissuadedFromCausingProsecution1512d4 (v : Person) (c : ComplaintText) : Prop






axiom OffenseCommittedOutsideUnitedStates1512h (p : Person) (c : ComplaintText) : Prop





axiom DistrictWhereProceedingIntendedToBeAffected1512i
    (d : District) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom DistrictWhereConductOccurred1512i
    (d : District) (p : Person) (c : ComplaintText) : Prop




axiom OffenseOccurredInConnectionWithCriminalTrial1512j
    (p : Person) (k : CriminalCase) (c : ComplaintText) : Prop







axiom AffirmativeDefenseLawfulTruthfulPersuasion1512e (p : Person) (c : ComplaintText) : Prop




axiom DefendantCarriedPreponderanceBurden1512e (p : Person) (c : ComplaintText) : Prop






axiom LawfulBonaFideLegalRepresentation1515c (p : Person) (c : ComplaintText) : Prop







axiom IsOfficialProceeding1515a1 (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom IsPhysicalForce1515a2 (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom IsMisleadingConduct1515a3 (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom IsLawEnforcementOfficerOrJudge1515a4 (o : Person) (c : ComplaintText) : Prop





axiom IsBodilyInjury1515a5 (v : Person) (c : ComplaintText) : Prop




axiom CorruptlyPersuades1515a6 (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom WouldBeMisleadingConductButForStateOfMind1515a6
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom ActedCorruptlyForSection1505 (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Deontic
