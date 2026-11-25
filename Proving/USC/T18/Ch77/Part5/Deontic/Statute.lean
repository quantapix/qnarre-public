















import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Deontic.Types
import Proving.USC.T18.Ch77.Part5.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Deontic

open Proving.USC.Common




def modality1591a : Modality := Modality.prohibition


def modality1591b : Modality := Modality.obligation


def modality1591d : Modality := Modality.prohibition


def modality1591dPunishment : Modality := Modality.obligation


def modality1591e : Modality := Modality.definition







inductive CoerciveMeansScienter (d : Person) (v : Person) (c : ComplaintText) :
    Prop where

  | knowledge : KnewCoerciveMeansWillBeUsed d v c → CoerciveMeansScienter d v c

  | recklessDisregard : ¬ ActConstitutingViolationIsAdvertising d c →
      RecklesslyDisregardedCoerciveMeans d v c → CoerciveMeansScienter d v c



inductive MinorityScienter (d : Person) (v : Person) (c : ComplaintText) :
    Prop where

  | knowledge : KnewVictimUnderEighteen d v c → MinorityScienter d v c

  | recklessDisregard : ¬ ActConstitutingViolationIsAdvertising d c →
      RecklesslyDisregardedVictimUnderEighteen d v c → MinorityScienter d v c







  | reasonableOpportunityToObserve : ProsecutionUnderSubsectionAOne c →
      ReasonableOpportunityToObserve d v c → MinorityScienter d v c


inductive Scienter1591a (d : Person) (v : Person) (c : ComplaintText) :
    Prop where
  | asToCoerciveMeans : CoerciveMeansScienter d v c → Scienter1591a d v c
  | asToMinority : MinorityScienter d v c → Scienter1591a d v c



inductive RegulatedAct1591a (d : Person) (v : Person) (c : ComplaintText) :
    Prop where

  | paragraphOne : JurisdictionalNexusMet d c → TraffickingActOccurred d v c →
      RegulatedAct1591a d v c



  | paragraphTwo (vn : Venture) : VentureEngagedInParagraphOneViolation vn v c →
      BenefitFromVentureOccurred d vn c → RegulatedAct1591a d v c



structure Prohibition1591a (d : Person) (v : Person) (c : ComplaintText) :
    Prop where

  addressee : AddresseeAnyPerson d c

  knowingly : ActedKnowingly d c

  scienter : Scienter1591a d v c



def Prohibition1591aViolated (d : Person) (v : Person) (c : ComplaintText) :
    Prop :=
  Prohibition1591a d v c ∧ RegulatedAct1591a d v c




inductive PrescribedPunishment1591b (s : SentencingAuthority) (d : Person)
    (v : Person) (c : ComplaintText) : Prop where

  | gradeOne : OffenseEffectedByCoerciveMeansOrVictimUnderFourteen d v c →
      ImposedFineAndImprisonmentFifteenYearsToLife s d c →
      PrescribedPunishment1591b s d v c

  | gradeTwo : OffenseNotSoEffectedAndVictimFourteenToSeventeen d v c →
      ImposedFineAndImprisonmentTenYearsToLife s d c →
      PrescribedPunishment1591b s d v c



structure Obligation1591b (s : SentencingAuthority) (d : Person) (v : Person)
    (c : ComplaintText) : Prop where
  addressee : AddresseeSentencingAuthority s c
  condition : ConvictedOfOffenseUnderSubsectionA d v c



def Obligation1591bDischarged (s : SentencingAuthority) (d : Person)
    (v : Person) (c : ComplaintText) : Prop :=
  Obligation1591b s d v c ∧ PrescribedPunishment1591b s d v c



def Obligation1591bBreached (s : SentencingAuthority) (d : Person) (v : Person)
    (c : ComplaintText) : Prop :=
  Obligation1591b s d v c ∧ ¬ PrescribedPunishment1591b s d v c




structure Prohibition1591d (d : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson d c

  condition : EnforcementOfSectionAtIssue c


def Prohibition1591dViolated (d : Person) (c : ComplaintText) : Prop :=
  Prohibition1591d d c ∧ ObstructionActOccurred d c


structure Obligation1591dPunishment (s : SentencingAuthority) (d : Person)
    (c : ComplaintText) : Prop where
  addressee : AddresseeSentencingAuthority s c
  condition : ConvictedOfOffenseUnderSubsectionD d c


def Obligation1591dPunishmentDischarged (s : SentencingAuthority) (d : Person)
    (c : ComplaintText) : Prop :=
  Obligation1591dPunishment s d c ∧
    ImposedFineOrImprisonmentNotExceedingTwentyFiveYears s d c


def Obligation1591dPunishmentBreached (s : SentencingAuthority) (d : Person)
    (c : ComplaintText) : Prop :=
  Obligation1591dPunishment s d c ∧
    ¬ ImposedFineOrImprisonmentNotExceedingTwentyFiveYears s d c




inductive Section1591Violated (d : Person) (v : Person) (c : ComplaintText) :
    Prop where
  | subsectionA : Prohibition1591aViolated d v c → Section1591Violated d v c
  | subsectionD : Prohibition1591dViolated d c → Section1591Violated d v c

end Proving.USC.T18.Ch77.Part5.Deontic
