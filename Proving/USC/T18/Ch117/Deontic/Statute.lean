import Proving.USC.T18.Ch117.Deontic.Types
import Proving.USC.T18.Ch117.Deontic.Predicates
import Proving.USC.Common.Types

















namespace Proving.USC.T18.Ch117.Deontic

open Proving.USC.Common





structure Prohibition2421a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  intent    : IntentProstitutionOrChargeableActivity p c


def ProhibitionViolated2421a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2421a p c ∧ KnowinglyTransportsForVice2421a p c




structure Prohibition2422a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  intent    : IntentProstitutionOrChargeableActivity p c


def ProhibitionViolated2422a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2422a p c ∧ KnowinglyEnticesTravelForVice2422a p c





structure Prohibition2422b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  minor     : IndividualIsMinor c
  intent    : IntentProstitutionOrChargeableActivity p c


def ProhibitionViolated2422b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2422b p c ∧ KnowinglyEnticesMinorForVice2422b p c




structure Prohibition2423a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  minor     : IndividualIsMinor c
  intent    : IntentProstitutionOrChargeableActivity p c


def ProhibitionViolated2423a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423a p c ∧ KnowinglyTransportsMinorForVice2423a p c





structure Prohibition2423b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  intent    : IntentIllicitSexualConduct p c


def ProhibitionViolated2423b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423b p c ∧ TravelsWithIllicitSexualIntent2423b p c





structure Prohibition2423c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUSCitizenOrLPR p c
  abroad    : TraveledOrResidesAbroad p c


def ProhibitionViolated2423c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423c p c ∧ EngagesInIllicitSexualConduct2423c p c





structure Prohibition2423d (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUSCitizenOrLPR p c
  orgNexus  : ActsThroughCommerceAffectingOrg p c
  intent    : IntentIllicitSexualConduct p c


def ProhibitionViolated2423d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423d p c ∧ CommitsIllicitConductThroughOrg2423d p c





structure Prohibition2423e (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  nexus     : InInterstateOrForeignCommerce p c
  gain      : ForCommercialAdvantageOrGain p c
  knowledge : KnowsTravelerIllicitIntent p c


def ProhibitionViolated2423e (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423e p c ∧ FacilitatesViceTravel2423e p c





structure Prohibition2423f (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAnyPerson p c
  target    : TargetsChapter117Offense c


def ProhibitionViolated2423f (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423f p c ∧ AttemptsOrConspiresChapter117_2423f p c





structure Prohibition2424aFalse (p : Person) (c : ComplaintText) : Prop where
  addressee : IsHarborerOfAlienForProstitution p c
  filing    : StatementBeingFiled p c


def ProhibitionViolated2424aFalse (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2424aFalse p c ∧ KnowinglyFalsifiesAlienStatement2424aFalse p c





structure Obligation2424aFile (p : Person) (c : ComplaintText) : Prop where
  addressee : IsHarborerOfAlienForProstitution p c
  commenced : HarboringAlienForProstitutionCommenced p c



def ObligationBreached2424aFile (p : Person) (c : ComplaintText) : Prop :=
  Obligation2424aFile p c ∧ ¬ FilesAlienStatement2424aFile p c





structure Obligation2421b1 (p : Person) (c : ComplaintText) : Prop where
  addressee   : IsAttorneyGeneral p c
  requested   : StateAGRequestedCrossDesignation c
  notUndermine : GrantWouldNotUndermineJustice c


def ObligationBreached2421b1 (p : Person) (c : ComplaintText) : Prop :=
  Obligation2421b1 p c ∧ ¬ GrantsCrossDesignation2421b1 p c





structure Obligation2421b2 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  denied    : RequestWasDenied c


def ObligationBreached2421b2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation2421b2 p c ∧ ¬ SubmitsDenialReasonTimely2421b2 p c






inductive MannActOffense (p : Person) (c : ComplaintText) : Prop where
  | s2421a : ProhibitionViolated2421a p c → MannActOffense p c
  | s2422a : ProhibitionViolated2422a p c → MannActOffense p c
  | s2422b : ProhibitionViolated2422b p c → MannActOffense p c
  | s2423a : ProhibitionViolated2423a p c → MannActOffense p c
  | s2423b : ProhibitionViolated2423b p c → MannActOffense p c
  | s2423c : ProhibitionViolated2423c p c → MannActOffense p c
  | s2423d : ProhibitionViolated2423d p c → MannActOffense p c
  | s2423e : ProhibitionViolated2423e p c → MannActOffense p c
  | s2423f : ProhibitionViolated2423f p c → MannActOffense p c
  | s2424  : ProhibitionViolated2424aFalse p c → MannActOffense p c

end Proving.USC.T18.Ch117.Deontic
