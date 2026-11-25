














import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIDef.Scienter.Types
import Proving.USC.T42.TitleVIIDef.Scienter.Predicates

namespace Proving.USC.T42.TitleVIIDef.Scienter

open Proving.USC.Common










structure Scienter2000e2DisparateTreatment (p : Person) (c : ComplaintText) where
  who      : Addressee
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState2000e2_disparateTreatment
  grounded : MentalStateProven p proven c



structure Scienter2000e2DisparateImpact (p : Person) (c : ComplaintText) where
  who      : Addressee
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState2000e2_disparateImpact
  grounded : MentalStateProven p proven c



structure Scienter2000e2ControlledSubstance (p : Person) (c : ComplaintText) where
  who      : Addressee
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState2000e2_controlledSubstance
  grounded : MentalStateProven p proven c



structure Scienter2000e3Retaliation (p : Person) (c : ComplaintText) where
  who      : Addressee
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState2000e3_retaliation
  grounded : MentalStateProven p proven c



structure Scienter2000e3Notice (p : Person) (c : ComplaintText) where
  who      : Addressee
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState2000e3_notice
  grounded : MentalStateProven p proven c



def DisparateTreatmentCulpable (p : Person) (c : ComplaintText) : Prop :=
  Nonempty (Scienter2000e2DisparateTreatment p c)



def DisparateImpactCulpable (p : Person) (c : ComplaintText) : Prop :=
  Nonempty (Scienter2000e2DisparateImpact p c)


def ControlledSubstanceCulpable (p : Person) (c : ComplaintText) : Prop :=
  Nonempty (Scienter2000e2ControlledSubstance p c)


def RetaliationCulpable (p : Person) (c : ComplaintText) : Prop :=
  Nonempty (Scienter2000e3Retaliation p c)


def NoticeCulpable (p : Person) (c : ComplaintText) : Prop :=
  Nonempty (Scienter2000e3Notice p c)

end Proving.USC.T42.TitleVIIDef.Scienter
