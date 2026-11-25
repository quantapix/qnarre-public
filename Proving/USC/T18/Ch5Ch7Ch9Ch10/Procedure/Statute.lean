






import Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure.Predicates

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure
open Proving.USC.Common





inductive FederalJurisdictionOverOffense (p : Person) (c : ComplaintText) : Prop
  | byNationality : ExtraterritorialNationalityNexus p c → FederalJurisdictionOverOffense p c
  | byCommerce    : InterstateCommerceNexus p c → FederalJurisdictionOverOffense p c
  | byPresence    : OffenderOrVictimUSNexus p c → FederalJurisdictionOverOffense p c



structure HabitualOffenderStatus (p : Person) (c : ComplaintText) : Prop where
  locus  : DomesticAssaultInSpecialJurisdiction p c
  priors : TwoPriorFinalConvictions p c



structure RestrictedPersonTransferBar (p : Person) (c : ComplaintText) : Prop where
  status   : AdjudicativeStatusRestricted p c
  commerce : InterstateCommerceNexus p c




structure UnregisteredSelectAgentPossession (p : Person) (c : ComplaintText) : Prop where
  required     : SelectAgentRegistrationRequired p c
  notRegistered : ¬ SelectAgentRegistrationObtained p c



inductive BankruptcyCaseConductWindow (p : Person) (c : ComplaintText) : Prop
  | afterFiling    : ConductAfterFiling p c → BankruptcyCaseConductWindow p c
  | inContemplation : ConductInContemplationOfFiling p c → BankruptcyCaseConductWindow p c



structure CognizableBankruptcyConduct (p : Person) (c : ComplaintText) : Prop where
  filed  : Title11PetitionFiled p c
  window : BankruptcyCaseConductWindow p c



structure EnforcementFrameworkEstablished (c : ComplaintText) : Prop where
  designation : AttorneyGeneralDesignation c
  referral    : BankruptcyCourtReferralProcedures c



structure EmergencyMilitaryAssistanceRequest (c : ComplaintText) : Prop where
  emergency : EmergencyInvolvingBiologicalWMD c
  requested : AttorneyGeneralRequestedMilitaryAssistance c



inductive LawfulSeizure (item : SeizableItem) (c : ComplaintText) : Prop
  | byWarrant : SeizureWarrantIssued item c → LawfulSeizure item c
  | byExigent : ExigentSeizureOnProbableCause item c → LawfulSeizure item c




structure ValidBiologicalWeaponForfeiture (item : SeizableItem) (c : ComplaintText) : Prop where
  seizure : LawfulSeizure item c
  notice  : NoticeToClaimantsGiven item c
  hearing : ForfeitureHearingOpportunity item c
  burden  : GovernmentMetPreponderanceBurden item c



structure CivilInjunctionAction (c : ComplaintText) : Prop where
  brought : UnitedStatesBroughtCivilAction c
  targets : TargetsProhibitedBiologicalConduct c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure
