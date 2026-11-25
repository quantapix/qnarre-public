







import Proving.USC.T18.Ch11.Reslice.Scienter.Types
import Proving.USC.T18.Ch11.Reslice.Scienter.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Scienter

open Proving.USC.Common




def ScienterMet (req : MentalState) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast req ∧ MentalStateProven p rung c





def Culpable201b (p : Person) (c : ComplaintText) : Prop :=
  ActedCorruptly p c ∧ ScienterMet RequiredMentalState201b p c



def Culpable201c (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState201c p c



def Culpable203 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState203 p c


def Culpable207 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState207 p c


def Culpable208 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState208 p c




def Culpable210 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState210 p c


def Culpable215 (p : Person) (c : ComplaintText) : Prop :=
  ActedCorruptly p c ∧ ScienterMet RequiredMentalState215 p c


def Culpable220 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState220 p c


def Culpable224 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState224 p c




def Culpable226 (p : Person) (c : ComplaintText) : Prop :=
  ActedCorruptly p c ∧ ScienterMet RequiredMentalState226 p c ∧
    (IntentToCommitTerrorismViaBribery p c ∨ KnewInfluenceUsedForTerrorism p c)



def Culpable227 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet RequiredMentalState227 p c




def CriminallyCulpable216 (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet WillfulCriminalEnhancement216 p c







inductive Chapter11ScienterFamily (p : Person) (c : ComplaintText) : Prop

  | corruptBribery (h : ActedCorruptly p c ∧ ScienterMet MentalState.Specific p c)

  | knowingOffence (h : ScienterMet MentalState.Knowledge p c)


  | strictOrStatus (h : ScienterMet MentalState.StrictLiability p c)

end Proving.USC.T18.Ch11.Reslice.Scienter
