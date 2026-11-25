




















import Proving.USC.T18.Ch117.Reslice.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Deontic

open Proving.USC.Common



def modality2421Aa : Modality := Modality.prohibition
def modality2421Ab : Modality := Modality.prohibition
def modality2421Ac : Modality := Modality.permission
def modality2421Ad : Modality := Modality.obligation
def modality2423a : Modality := Modality.prohibition
def modality2423b : Modality := Modality.prohibition
def modality2423c : Modality := Modality.prohibition
def modality2423d : Modality := Modality.prohibition
def modality2423e : Modality := Modality.prohibition
def modality2423f : Modality := Modality.prohibition

def modality2423g : Modality := Modality.definition

def modality2423h : Modality := Modality.definition





structure Prohibition2421Aa (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  addressee : OwnsManagesOrOperatesInteractiveComputerService p s c
  condition : UsesFacilityOrMeansOfInterstateOrForeignCommerce p c




def Prohibition2421AaViolated (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop :=
  Prohibition2421Aa p s c ∧ IntentToPromoteOrFacilitateProstitutionOfAnother p s c




inductive Aggravator2421Ab (p : Person) (c : ComplaintText) : Prop where
  | fiveOrMorePersons :
      PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c → Aggravator2421Ab p c
  | recklessDisregardOfSexTrafficking :
      ActsInRecklessDisregardOfContributionToSexTrafficking p c → Aggravator2421Ab p c


structure Prohibition2421Ab (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  base : Prohibition2421Aa p s c
  intent : IntentToPromoteOrFacilitateProstitutionOfAnother p s c



def Prohibition2421AbViolated (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop :=
  Prohibition2421Ab p s c ∧ Aggravator2421Ab p c






def AffirmativeDefense2421Ae (p : Person) (c : ComplaintText) : Prop :=
  ∃ j : TargetedJurisdiction, ProstitutionLegalInTargetedJurisdiction p j c


def Prohibition2421AaLiable (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop :=
  Prohibition2421AaViolated p s c ∧ ¬ AffirmativeDefense2421Ae p c



def Prohibition2421Ab1Liable (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop :=
  Prohibition2421Ab p s c ∧ PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c
    ∧ ¬ AffirmativeDefense2421Ae p c





structure Permission2421Ac (v : Person) (p : Person)
    (ct : UnitedStatesDistrictCourt) (c : ComplaintText) : Prop where
  injury : InjuredByReasonOfViolation v p c
  forum : ForumIsAppropriateUnitedStatesDistrictCourt ct c


def Permission2421AcAvailable (v : Person) (p : Person)
    (ct : UnitedStatesDistrictCourt) (c : ComplaintText) : Prop :=
  Permission2421Ac v p ct c





structure Obligation2421Ad (ct : UnitedStatesDistrictCourt) (p : Person)
    (c : ComplaintText) : Prop where
  condition : ViolationOfSubsection2421Ab2Established p c



def Obligation2421AdBreached (ct : UnitedStatesDistrictCourt) (p : Person)
    (c : ComplaintText) : Prop :=
  Obligation2421Ad ct p c ∧ ¬ CourtOrderedRestitution ct p c


def Obligation2421AdDischarged (ct : UnitedStatesDistrictCourt) (p : Person)
    (c : ComplaintText) : Prop :=
  Obligation2421Ad ct p c ∧ CourtOrderedRestitution ct p c





inductive IllicitSexualConduct (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | sexualActWithMinor :
      SexualActWithPersonUnderEighteenViolatingChapter109A p v c →
      IllicitSexualConduct p v c
  | commercialSexActWithMinor :
      CommercialSexActWithPersonUnderEighteen p v c → IllicitSexualConduct p v c
  | productionOfChildPornography :
      ProducesChildPornography p v c → IllicitSexualConduct p v c





structure Prohibition2423a (p : Person) (v : Person) (c : ComplaintText) : Prop where
  minority : IndividualHasNotAttainedAgeOfEighteen v c
  intent : IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity p v c


def Prohibition2423aViolated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition2423a p v c ∧ KnowinglyTransportsIndividualInCoveredCommerce p v c




structure Prohibition2423b (p : Person) (c : ComplaintText) : Prop where
  intent : IntentToEngageInIllicitSexualConduct p c


def Prohibition2423bViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423b p c ∧ TravelsInCoveredCommerce p c





structure Prohibition2423c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCitizenOrLawfulPermanentResident p c
  condition : TravelsInForeignCommerceOrResidesInForeignCountry p c



def Prohibition2423cViolated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition2423c p c ∧ IllicitSexualConduct p v c





def Defense2423i (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  CommercialSexActWithPersonUnderEighteen p v c ∧
    ReasonableBeliefThatPersonHadAttainedEighteen p v c


def Prohibition2423cLiable (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition2423cViolated p v c ∧ ¬ Defense2423i p v c





structure Prohibition2423d (p : Person) (o : CoveredOrganization)
    (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCitizenOrLawfulPermanentResident p c
  affiliation : IsOfficerDirectorEmployeeOrAgentOfCoveredOrganization p o c



def Prohibition2423dViolated (p : Person) (o : CoveredOrganization)
    (c : ComplaintText) : Prop :=
  Prohibition2423d p o c ∧
    UsesMailsOrInterstateInstrumentalityThroughOrganization p o c ∧
    CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization p o c





structure Prohibition2423e (p : Person) (t : Person) (c : ComplaintText) : Prop where
  purpose : ForCommercialAdvantageOrPrivateFinancialGain p c
  knowledge : KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct p t c


def Prohibition2423eViolated (p : Person) (t : Person) (c : ComplaintText) : Prop :=
  Prohibition2423e p t c ∧ ArrangesInducesProcuresOrFacilitatesTravel p t c





structure Prohibition2423f (p : Person) (s : Subsection2423) (c : ComplaintText) : Prop where
  inchoateAct : AttemptsOrConspiresToViolateSubsection p s c


def Prohibition2423fViolated (p : Person) (s : Subsection2423) (c : ComplaintText) : Prop :=
  Prohibition2423f p s c

end Proving.USC.T18.Ch117.Reslice.Deontic
