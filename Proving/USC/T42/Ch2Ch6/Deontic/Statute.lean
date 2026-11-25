











import Proving.USC.T42.Ch2Ch6.Deontic.Predicates

namespace Proving.USC.T42.Ch2Ch6.Deontic
open Proving.USC.Common




structure Power88 (c : ComplaintText) : Prop where
  engaged : StateLawRestrictsPortEntry88 c

def Power88Exercised (c : ComplaintText) : Prop :=
  Power88 c ∧ GrantsUnladingPermit88 c



structure Obligation89 (c : ComplaintText) : Prop where
  engaged : RevenueSafetyRequiresWarehouse89 c

def Obligation89Breached (c : ComplaintText) : Prop :=
  Obligation89 c ∧ ¬ WarehousesErected89 c


structure Obligation90 (c : ComplaintText) : Prop where
  engaged : CargoUnladenElsewhere90 c


def Obligation90Breached (c : ComplaintText) : Prop :=
  Obligation90 c ∧ ¬ CargoArticlesDeposited90 c


structure Power91 (c : ComplaintText) : Prop where
  engaged : ConformityRequiresExtension91 c

def Power91Exercised (c : ComplaintText) : Prop :=
  Power91 c ∧ ProlongsVesselEntryTerms91 c


structure Prohibition91 (c : ComplaintText) : Prop where
  engaged : VesselSubjectToQuarantine91 c

def Prohibition91Violated (c : ComplaintText) : Prop :=
  Prohibition91 c ∧ CargoUnladenOtherwiseThanAllowed91 c



structure Obligation97 (c : ComplaintText) : Prop where
  engaged : StateQuarantineRespectingVessel97 c


def Obligation97Breached (c : ComplaintText) : Prop :=
  Obligation97 c ∧ ¬ USOfficerObservesAndAidsHealthLaws97 c


structure Power98 (c : ComplaintText) : Prop where
  engaged : HHSRequestsSpareNavyVessels98 c


def Power98Exercised (c : ComplaintText) : Prop :=
  Power98 c ∧ PlacesVesselsAtQuarantineDisposal98 c



structure Power112 (c : ComplaintText) : Prop where
  engaged : EpidemicEndangersOfficersAtPort112 c

def Power112Exercised (c : ComplaintText) : Prop :=
  Power112 c ∧ DirectsRemovalOfRevenueOfficers112 c


structure Obligation112 (c : ComplaintText) : Prop where
  engaged : RemovalOfOfficersDirected112 c


def Obligation112Breached (c : ComplaintText) : Prop :=
  Obligation112 c ∧ ¬ PublicNoticeOfRemovalGiven112 c





structure Obligation191 (c : ComplaintText) : Prop where
  engaged : DepartmentBoundToEstablishBureau191 c

def Obligation191Breached (c : ComplaintText) : Prop :=
  Obligation191 c ∧ ¬ ChildrensBureauEstablished191 c



structure Obligation192 (c : ComplaintText) : Prop where
  engaged : BureauBoundToInvestigate192 c


def Obligation192Breached (c : ComplaintText) : Prop :=
  Obligation192 c ∧ ¬ InvestigatesAndReportsChildWelfare192 c



structure Prohibition192 (c : ComplaintText) : Prop where
  engaged : HeadOfFamilyObjectsToEntry192 c


def Prohibition192Violated (c : ComplaintText) : Prop :=
  Prohibition192 c ∧ BureauOfficialEntersFamilyResidence192 c



structure Obligation193 (c : ComplaintText) : Prop where
  engaged : SecretaryBoundToAppointAssistant193 c

def Obligation193Breached (c : ComplaintText) : Prop :=
  Obligation193 c ∧ ¬ AssistantChiefAppointed193 c


structure Obligation194 (c : ComplaintText) : Prop where
  engaged : SecretaryBoundToFurnishQuarters194 c

def Obligation194Breached (c : ComplaintText) : Prop :=
  Obligation194 c ∧ ¬ QuartersFurnished194 c




def RentalWithinCap194 (c : ComplaintText) : Prop :=
  ClaimedAnnualRentalDollars194 c ≤ 2000

end Proving.USC.T42.Ch2Ch6.Deontic
