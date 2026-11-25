import Proving.USC.T21.Deontic.Types
import Proving.USC.Common.Types







namespace Proving.USC.T21.Deontic

open Proving.USC.Common (Person ComplaintText)




axiom AnyPersonAddressee (p : Person) (c : ComplaintText) : Prop




axiom NotAuthorizedBySubchapter (p : Person) (c : ComplaintText) : Prop




axiom ControlledSubstanceActOccurred841a1 (p : Person) (c : ComplaintText) : Prop




axiom CounterfeitSubstanceActOccurred841a2 (p : Person) (c : ComplaintText) : Prop






axiom ListedChemicalActOccurred841c (p : Person) (c : ComplaintText) : Prop



axiom BoobytrapActOccurred841d (p : Person) (c : ComplaintText) : Prop




axiom FederalDrugPropertyCondition841d (p : Person) (c : ComplaintText) : Prop





axiom DateRapeDrugInternetActOccurred841g1 (p : Person) (c : ComplaintText) : Prop




axiom InternetDistributionActOccurred841h (p : Person) (c : ComplaintText) : Prop




axiom CourtAddressee (ct : Court) (c : ComplaintText) : Prop



axiom SentenceImposedPer841b (ct : Court) (p : Person) (c : ComplaintText) : Prop



axiom ProbationOrSuspensionGranted841b1C (ct : Court) (p : Person) (c : ComplaintText) : Prop




axiom MandatoryTermApplies841b1C (p : Person) (c : ComplaintText) : Prop




axiom FelonyListedChemicalConviction841e (p : Person) (c : ComplaintText) : Prop





axiom ListedChemicalDistributionOccurred841f1 (p : Person) (c : ComplaintText) : Prop




axiom KnowledgeOfRecordkeepingViolation841f2 (p : Person) (c : ComplaintText) : Prop




axiom RemedialStepsTaken841f2 (p : Person) (c : ComplaintText) : Prop




axiom AttorneyGeneralAddressee (ag : Official) (c : ComplaintText) : Prop



axiom ConspiracyOrAttemptActOccurred846 (p : Person) (c : ComplaintText) : Prop



axiom ObjectOffenseInSubchapter846 (p : Person) (c : ComplaintText) : Prop



axiom SamePenaltiesImposed846 (ct : Court) (p : Person) (c : ComplaintText) : Prop




axiom TermDefined (t : DefinedTerm) (c : ComplaintText) : Prop




axiom ClaimsSteroidExemption802p41 (p : Person) (c : ComplaintText) : Prop




axiom BurdenOfGoingForwardBorne802p41 (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T21.Deontic
