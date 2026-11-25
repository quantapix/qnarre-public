




















import Proving.USC.T18.Ch96.EchoReslice.Deontic.Types
import Proving.USC.T18.Ch96.EchoReslice.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Deontic

open Proving.USC.Common





def modalityAccessDetermination1967 : Modality := Modality.Power



def modalityProceedingStatus1967 : Modality := Modality.Permission




def modalityConsiderationDuty1967 : Modality := Modality.Obligation





def AddresseeInClass (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  IsPresidingCourt ct pr c





def QualifyingCivilAction1967 (pr : Proceeding) (c : ComplaintText) : Prop :=
  IsCivilActionInstitutedByUnitedStates pr c ∧ ArisesUnderChapter96 pr c



def ConditionMet (pr : Proceeding) (c : ComplaintText) : Prop :=
  QualifyingCivilAction1967 pr c
  ∨ ∃ pr' : Proceeding, IsAncillaryTo pr pr' c ∧ QualifyingCivilAction1967 pr' c






inductive AccessDetermination1967 (ct : Court) (pr : Proceeding)
    (c : ComplaintText) : Prop where

  | opened (h : DeterminedOpenToPublic ct pr c) : AccessDetermination1967 ct pr c

  | closed (h : DeterminedClosedToPublic ct pr c) : AccessDetermination1967 ct pr c



def RegulatedActOccurred (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  AccessDetermination1967 ct pr c






def ConsiderationOfAffectedRightsGiven (ct : Court) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  (∀ p : Person, IsAffectedPerson p pr c → RightsConsidered ct p pr c)
  ∧ ConsiderationPrecededDetermination ct pr c






structure Power1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass ct pr c

  condition : ConditionMet pr c



def PowerExercised1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Power1967 ct pr c ∧ RegulatedActOccurred ct pr c ∧ DiscretionActuallyExercised ct pr c




structure Obligation1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass ct pr c

  condition : ConditionMet pr c

  trigger : RegulatedActOccurred ct pr c



def ObligationSatisfied1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation1967 ct pr c ∧ ConsiderationOfAffectedRightsGiven ct pr c




def ObligationBreached1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation1967 ct pr c ∧ ¬ ConsiderationOfAffectedRightsGiven ct pr c



def ValidExercise1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  PowerExercised1967 ct pr c ∧ ConsiderationOfAffectedRightsGiven ct pr c






def UnauthorizedByS1967 (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  RegulatedActOccurred ct pr c ∧ ¬ ConditionMet pr c

end Proving.USC.T18.Ch96.EchoReslice.Deontic
