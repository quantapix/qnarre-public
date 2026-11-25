





import Proving.USC.T18.Ch113B.Remedy.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Remedy

open Proving.USC.Common







axiom HasPrivateRightOfAction (p : Person) (c : ComplaintText) : Prop




axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsEstateSurvivorOrHeir (p : Person) (q : Person) (c : ComplaintText) : Prop




axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop




axiom CausedByViolation (p : Person) (c : ComplaintText) : Prop





axiom IsActOfInternationalTerrorism (c : ComplaintText) : Prop





axiom CommittedActOfInternationalTerrorism (d : Person) (c : ComplaintText) : Prop







axiom PriorCriminalJudgmentForUnitedStates (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom PriorCriminalJudgmentForForeignState (j : CriminalJudgment) (c : ComplaintText) : Prop





axiom AccordedFullFaithAndCredit (j : CriminalJudgment) (c : ComplaintText) : Prop




axiom DefendantWasDefendantInPriorProceeding
    (d : Person) (j : CriminalJudgment) (c : ComplaintText) : Prop








axiom OrganizationDesignatedForeignTerroristOrganization
    (o : ForeignTerroristOrganization) (c : ComplaintText) : Prop




axiom ActCommittedPlannedOrAuthorizedByOrganization
    (o : ForeignTerroristOrganization) (c : ComplaintText) : Prop




axiom AidsAndAbetsByKnowinglyProvidingSubstantialAssistance
    (d : Person) (c : ComplaintText) : Prop




axiom ConspiresWithPersonCommittingAct (d : Person) (c : ComplaintText) : Prop






axiom HasObtainedJudgmentAgainstTerroristParty
    (p : Person) (d : Person) (c : ComplaintText) : Prop






axiom AssetSeizedOrFrozenUnderKingpinAct
    (a : BlockedAsset) (d : Person) (c : ComplaintText) : Prop







axiom ViolatedSection2332 (d : Person) (c : ComplaintText) : Prop





axiom ViolatedSection2332a (d : Person) (c : ComplaintText) : Prop




axiom ViolatedSection2332b (d : Person) (c : ComplaintText) : Prop





axiom ViolatedSection2332d (d : Person) (c : ComplaintText) : Prop






axiom ViolatedSection2332f (d : Person) (c : ComplaintText) : Prop





axiom ViolatedSection2332g (d : Person) (c : ComplaintText) : Prop





axiom ViolatedSection2332h (d : Person) (c : ComplaintText) : Prop






axiom ViolatedSection2332i (d : Person) (c : ComplaintText) : Prop









axiom JurisdictionalNexusEstablished (d : Person) (c : ComplaintText) : Prop





axiom AttorneyGeneralCertificationFiled (d : Person) (c : ComplaintText) : Prop





axiom OffenseIntendedToCoerceIntimidateOrRetaliate (d : Person) (c : ComplaintText) : Prop






axiom ArmedForcesOrMilitaryForcesExclusion (d : Person) (c : ComplaintText) : Prop






axiom NationalityOnlyDomesticOffenseExclusion (d : Person) (c : ComplaintText) : Prop






axiom UnitedStatesAuthorityOrContractExclusion (d : Person) (c : ComplaintText) : Prop





axiom TreasuryRegulationExemption (d : Person) (c : ComplaintText) : Prop





axiom DeathResultedFromViolation (d : Person) (c : ComplaintText) : Prop








axiom IsFederalCrimeOfTerrorism (d : Person) (c : ComplaintText) : Prop





axiom EmergencyInvolvingWeaponOfMassDestruction (c : ComplaintText) : Prop





axiom MilitaryAssistanceRequestedByAttorneyGeneral (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Remedy
