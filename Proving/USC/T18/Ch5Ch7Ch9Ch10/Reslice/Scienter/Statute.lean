

























import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter

open Proving.USC.Common









def MeetsRequirement (req : MentalState) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast req ∧ MentalStateProven p rung c






def RequiredMentalState111Base : Option MentalState := none



def RequiredMentalState111Aggravator : Option MentalState := some .Specific


def Scienter111Aggravator (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToCommitAnotherFelony c



def RequiredMentalState112a : Option MentalState := none


def RequiredMentalState112b : Option MentalState := some .Specific



def Scienter112b (p : Person) (c : ComplaintText) : Prop :=
  WillfulnessProven p c




def Scienter112b3 (p : Person) (c : ComplaintText) : Prop :=
  WillfulnessProven p c ∧ SpecificPurposeProven p .ToViolateForeignOfficialProtection c



def RequiredMentalState113a1 : Option MentalState := some .Specific


def Scienter113a1 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToCommitMurder c



def Scienter113a2 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToCommitAnotherFelony c



def Scienter113a3 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToDoBodilyHarm c




def RequiredMentalState113a4to7 : Option MentalState := none






def RequiredMentalState113a8 : Option MentalState := some .Recklessness


def Scienter113a8 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Recklessness p c



def RequiredMentalState114 : Option MentalState := some .Specific


def Scienter114 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToTortureMaimOrDisfigure c



def RequiredMentalState115a1 : Option MentalState := some .Specific


def Scienter115a1 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToImpedeOrIntimidateOfficial c ∨
  SpecificPurposeProven p .ToRetaliateForOfficialDuties c


def Scienter115a2 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToRetaliateForOfficialDuties c


def RequiredMentalState116a : Option MentalState := some .Knowledge





def Scienter116a (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c



def Scienter116a3 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ SpecificPurposeProven p .ToPerformFGM c



def RequiredMentalState117 : Option MentalState := none





def RequiredMentalState117PriorConvictions : Option MentalState :=
  some .StrictLiability


def Scienter117PriorConvictions (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .StrictLiability p c



def RequiredMentalState118 : Option MentalState := some .Specific


def Scienter118 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ WillfulnessProven p c





def RequiredMentalState119a : Option MentalState := some .Specific


def Scienter119a (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧
  SpecificPurposeProven p .ToThreatenIntimidateOrIncite c




def RequiredMentalState152 : Option MentalState := some .Specific


def Scienter152 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ FraudulentIntentProven p c



def Scienter152p5 (p : Person) (c : ComplaintText) : Prop :=
  Scienter152 p c ∧ SpecificPurposeProven p .ToDefeatTitle11 c



def Scienter152p7 (p : Person) (c : ComplaintText) : Prop :=
  Scienter152 p c ∧ SpecificPurposeProven p .ToDefeatTitle11 c


def RequiredMentalState153 : Option MentalState := some .Specific


def Scienter153 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ FraudulentIntentProven p c




def RequiredMentalState154 : Option MentalState := some .Knowledge


def Scienter154 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c



def RequiredMentalState155 : Option MentalState := some .Specific


def Scienter155 (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ FraudulentIntentProven p c ∧
  SpecificPurposeProven p .ToFixFeesFromEstate c



def RequiredMentalState156b : Option MentalState := some .Knowledge


def Scienter156b (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c




def RequiredMentalState157 : Option MentalState := some .Specific


def Scienter157 (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ToDefraud c ∧
  SpecificPurposeProven p .ToExecuteOrConcealScheme c







def RequiredMentalState175SubsecA : Option MentalState := some .Knowledge


def Scienter175SubsecA (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ SpecificPurposeProven p .ForUseAsWeapon c







def RequiredMentalState175SubsecB : Option MentalState := some .Knowledge


def Scienter175SubsecB (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ ¬ SpecificPurposeProven p .ForPeacefulPurpose c




def RequiredMentalState175bSubsecA : Option MentalState := some .Knowledge


def Scienter175bSubsecA (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∧ KnowsOwnRestrictedPersonStatus p c






def RequiredMentalState175bSubsecB : Option MentalState := some .Negligence


def Scienter175bSubsecB (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c ∨ ReasonableCauseToBelieveProven p c


def RequiredMentalState175bSubsecC : Option MentalState := some .Knowledge


def Scienter175bSubsecC (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c





def RequiredMentalState175c : Option MentalState := some .Knowledge


def Scienter175c (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement .Knowledge p c






def PeacefulPurposeDefense (p : Person) (c : ComplaintText) : Prop :=
  SpecificPurposeProven p .ForPeacefulPurpose c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter
