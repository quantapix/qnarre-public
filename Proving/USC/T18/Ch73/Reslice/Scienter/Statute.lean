





import Proving.USC.T18.Ch73.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)






def requiredMentalState : Clause → ScienterDemand
  | .S1512a1 => .Requires .Specific
  | .S1512a2 => .Requires .Specific
  | .S1512a2Bii => .Requires .Specific
  | .S1512bConduct => .Requires .Knowledge
  | .S1512bObjective => .Requires .Specific
  | .S1512b2B => .Requires .Specific
  | .S1512c1Intent => .Requires .Specific
  | .S1512c2 => .Unspecified
  | .S1512dHarassment => .Requires .Specific
  | .S1512dResult => .Requires .StrictLiability
  | .S1512eDefense => .Requires .Specific
  | .S1512gFederalNexus => .Requires .StrictLiability
  | .S1512kConspiracy => .Unspecified
  | .S1515a3A => .Requires .Knowledge
  | .S1515a3B => .Requires .Specific
  | .S1515a3CKnowledge => .Requires .Knowledge
  | .S1515a3CIntent => .Requires .Specific
  | .S1515a3DKnowledge => .Requires .Knowledge
  | .S1515a3DIntent => .Requires .Specific
  | .S1515a3EKnowledge => .Requires .Knowledge
  | .S1515a3EIntent => .Requires .Specific
  | .S1515bImproperPurpose1505 => .Requires .Specific


def addresseeOf : Clause → Addressee
  | .S1512a2Bii => .PersonInduced
  | .S1512b2B => .PersonInduced
  | _ => .Defendant


def polarityOf : Clause → ClausePolarity
  | .S1512eDefense => .Exculpatory
  | _ => .Inculpatory


def burdenOf : Clause → BurdenAllocation
  | .S1512eDefense => { bearer := .Defendant, standard := .Preponderance }
  | _ => { bearer := .Unallocated, standard := .Unstated }









def ScienterDemand.SatisfiedBy (d : ScienterDemand) (p : Person) (cl : Clause)
    (c : ComplaintText) : Prop :=
  match d with
  | .Requires .StrictLiability => True
  | .Requires m => ∃ rung : MentalState, rung.atLeast m ∧ MentalStateProven p cl rung c
  | .Unspecified => ∃ rung : MentalState, MentalStateProven p cl rung c


def ClauseCulpable (cl : Clause) (p : Person) (c : ComplaintText) : Prop :=
  (requiredMentalState cl).SatisfiedBy p cl c






def MisleadingProngScienter (mp : MisleadingProng) (p : Person) (c : ComplaintText) : Prop :=
  match mp with
  | .FalseStatement => ClauseCulpable .S1515a3A p c
  | .OmissionOrConcealment => ClauseCulpable .S1515a3B p c
  | .WritingOrRecording =>
      ClauseCulpable .S1515a3CKnowledge p c ∧ ClauseCulpable .S1515a3CIntent p c
  | .SampleOrObject =>
      ClauseCulpable .S1515a3DKnowledge p c ∧ ClauseCulpable .S1515a3DIntent p c
  | .TrickSchemeDevice =>
      ClauseCulpable .S1515a3EKnowledge p c ∧ ClauseCulpable .S1515a3EIntent p c


def MisleadingConductScienter (p : Person) (c : ComplaintText) : Prop :=
  ∃ mp : MisleadingProng, MisleadingProngScienter mp p c





def CorruptPersuasionScienter (p : Person) (c : ComplaintText) : Prop :=
  Corruptly p c ∧ ¬ MisleadingConductButForLackOfStateOfMind p c



def Corruptly1505 (p : Person) (c : ComplaintText) : Prop :=
  ActsWithImproperPurpose p c





def Scienter1512a1 (p : Person) (c : ComplaintText) : Prop :=
  ClauseCulpable .S1512a1 p c


def Scienter1512a2 (p : Person) (c : ComplaintText) : Prop :=
  ClauseCulpable .S1512a2 p c



structure Scienter1512a2ViaObjectImpairment
    (p : Person) (induced : Person) (c : ComplaintText) : Prop where
  defendantIntent : ClauseCulpable .S1512a2 p c
  inducedIntent : ClauseCulpable .S1512a2Bii induced c



def ConductRouteScienter (r : ConductRoute1512b) (p : Person) (c : ComplaintText) : Prop :=
  match r with
  | .Intimidation => ClauseCulpable .S1512bConduct p c
  | .Threat => ClauseCulpable .S1512bConduct p c
  | .CorruptPersuasion => ClauseCulpable .S1512bConduct p c ∧ CorruptPersuasionScienter p c
  | .MisleadingConduct => ClauseCulpable .S1512bConduct p c ∧ MisleadingConductScienter p c



structure Scienter1512b (r : ConductRoute1512b) (p : Person) (c : ComplaintText) : Prop where
  conduct : ConductRouteScienter r p c
  objective : ClauseCulpable .S1512bObjective p c


structure Scienter1512bViaObjectImpairment
    (r : ConductRoute1512b) (p : Person) (induced : Person) (c : ComplaintText) : Prop where
  base : Scienter1512b r p c
  inducedIntent : ClauseCulpable .S1512b2B induced c


structure Scienter1512c1 (p : Person) (c : ComplaintText) : Prop where
  corruptly : Corruptly p c
  intentToImpair : ClauseCulpable .S1512c1Intent p c



structure Scienter1512c2 (p : Person) (c : ComplaintText) : Prop where
  corruptly : Corruptly p c
  pleadedState : ClauseCulpable .S1512c2 p c



structure Scienter1512d (p : Person) (c : ComplaintText) : Prop where
  intentionalHarassment : ClauseCulpable .S1512dHarassment p c
  result : ClauseCulpable .S1512dResult p c


def Scienter1512k (p : Person) (c : ComplaintText) : Prop :=
  ClauseCulpable .S1512kConspiracy p c



def FederalNexusScienter (p : Person) (c : ComplaintText) : Prop :=
  ClauseCulpable .S1512gFederalNexus p c






structure Defense1512e (p : Person) (c : ComplaintText) : Prop where
  solelyLawfulConduct : ConductSolelyLawful p c
  soleIntention : SoleIntentionToEncourageTruthfulTestimony p c
  pleadedIntent : ClauseCulpable .S1512eDefense p c





inductive Section1512Culpable (p : Person) (c : ComplaintText) : Prop
  | a1 (h : Scienter1512a1 p c)
  | a2 (h : Scienter1512a2 p c)
  | a2ObjectImpairment (induced : Person) (h : Scienter1512a2ViaObjectImpairment p induced c)
  | b (r : ConductRoute1512b) (h : Scienter1512b r p c)
  | bObjectImpairment (r : ConductRoute1512b) (induced : Person)
      (h : Scienter1512bViaObjectImpairment r p induced c)
  | c1 (h : Scienter1512c1 p c)
  | c2 (h : Scienter1512c2 p c)
  | d (h : Scienter1512d p c)
  | k (h : Scienter1512k p c)





def Section1512ScienterLiable (p : Person) (c : ComplaintText) : Prop :=
  Section1512Culpable p c ∧ ¬ Defense1512e p c ∧ ¬ LawfulBonaFideLegalRepresentation p c

end Proving.USC.T18.Ch73.Reslice.Scienter
