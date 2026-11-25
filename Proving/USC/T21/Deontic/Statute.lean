import Proving.USC.T21.Deontic.Types
import Proving.USC.T21.Deontic.Predicates
import Proving.USC.Common.Types









namespace Proving.USC.T21.Deontic

open Proving.USC.Common (Person ComplaintText)





inductive RegulatedAct841a (p : Person) (c : ComplaintText) : Prop where
  | controlled  : ControlledSubstanceActOccurred841a1 p c → RegulatedAct841a p c
  | counterfeit : CounterfeitSubstanceActOccurred841a2 p c → RegulatedAct841a p c



structure Prohibition841a (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : NotAuthorizedBySubchapter p c



def ProhibitionViolated841a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841a p c ∧ RegulatedAct841a p c




structure Prohibition841c (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : NotAuthorizedBySubchapter p c


def ProhibitionViolated841c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841c p c ∧ ListedChemicalActOccurred841c p c






structure Prohibition841d (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : FederalDrugPropertyCondition841d p c


def ProhibitionViolated841d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841d p c ∧ BoobytrapActOccurred841d p c






structure Prohibition841g1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c


def ProhibitionViolated841g1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841g1 p c ∧ DateRapeDrugInternetActOccurred841g1 p c





structure Prohibition841h (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : NotAuthorizedBySubchapter p c


def ProhibitionViolated841h (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841h p c ∧ InternetDistributionActOccurred841h p c






structure Obligation841b (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : CourtAddressee ct c
  condition : ProhibitionViolated841a p c



def ObligationBreached841b (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation841b ct p c ∧ ¬ SentenceImposedPer841b ct p c






structure Prohibition841b1C (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : CourtAddressee ct c
  condition : MandatoryTermApplies841b1C p c


def ProhibitionViolated841b1C (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841b1C ct p c ∧ ProbationOrSuspensionGranted841b1C ct p c






structure Power841e (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : CourtAddressee ct c
  condition : FelonyListedChemicalConviction841e p c








structure Prohibition841f1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c


def ProhibitionViolated841f1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition841f1 p c ∧ ListedChemicalDistributionOccurred841f1 p c






structure Obligation841f2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : KnowledgeOfRecordkeepingViolation841f2 p c


def ObligationBreached841f2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation841f2 p c ∧ ¬ RemedialStepsTaken841f2 p c






structure Power841g3 (ag : Official) (c : ComplaintText) : Prop where
  addressee : AttorneyGeneralAddressee ag c





structure Prohibition846 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : ObjectOffenseInSubchapter846 p c


def ProhibitionViolated846 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition846 p c ∧ ConspiracyOrAttemptActOccurred846 p c






structure Obligation846 (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : CourtAddressee ct c
  condition : ProhibitionViolated846 p c


def ObligationBreached846 (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation846 ct p c ∧ ¬ SamePenaltiesImposed846 ct p c





structure Definition802 (t : DefinedTerm) (c : ComplaintText) : Prop where
  defined : TermDefined t c






structure Obligation802p41 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c
  condition : ClaimsSteroidExemption802p41 p c


def ObligationBreached802p41 (p : Person) (c : ComplaintText) : Prop :=
  Obligation802p41 p c ∧ ¬ BurdenOfGoingForwardBorne802p41 p c

end Proving.USC.T21.Deontic
