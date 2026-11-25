







import Proving.USC.T18.Ch77.Part4.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Procedure

open Proving.USC.Common




axiom ChargeFiledUnderSection1591 (pr : Prosecution) (c : ComplaintText) : Prop





axiom ProsecutionUnderSubsectionA1 (pr : Prosecution) (c : ComplaintText) : Prop





axiom ProsecutionUnderSubsectionA2 (pr : Prosecution) (c : ComplaintText) : Prop




axiom InOrAffectingInterstateOrForeignCommerce (pr : Prosecution) (c : ComplaintText) : Prop





axiom WithinSpecialMaritimeAndTerritorialJurisdiction (pr : Prosecution) (c : ComplaintText) : Prop




axiom GovernmentProvedKnowingActusReus (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedKnowledgeOfMeansTheory (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedRecklessDisregardOfMeansTheory (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedKnowledgeOfMinorityTheory (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedRecklessDisregardOfMinorityTheory (pr : Prosecution) (c : ComplaintText) : Prop





axiom ChargedActIsAdvertising (ca : ChargedAct) (c : ComplaintText) : Prop








axiom ChargedActIsNonAdvertisingEnumeratedAct (ca : ChargedAct) (c : ComplaintText) : Prop





axiom ReasonableOpportunityToObserve (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom ConvictionEnteredUnderSection1591 (pr : Prosecution) (c : ComplaintText) : Prop





axiom OffenseEffectedByForceFraudOrCoercion (pr : Prosecution) (c : ComplaintText) : Prop




axiom LifeSentenceImposed (pr : Prosecution) (c : ComplaintText) : Prop




axiom ObstructsOrInterferesWithEnforcement (p : Person) (c : ComplaintText) : Prop





axiom AttemptsToObstructEnforcement (p : Person) (c : ComplaintText) : Prop








axiom victimAgeYearsAtOffense (pr : Prosecution) (c : ComplaintText) : Nat






axiom sentenceImposedYears (pr : Prosecution) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part4.Procedure
