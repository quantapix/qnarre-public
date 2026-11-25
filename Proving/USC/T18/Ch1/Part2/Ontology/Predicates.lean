











import Proving.USC.T18.Ch1.Part2.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Ontology

open Proving.USC.Common






axiom IsObligationOrSecurityOfForeignGovernment
    (s : ForeignGovernmentSecurity) (c : ComplaintText) : Prop






axiom IsCrimeOfViolence (o : Offense) (c : ComplaintText) : Prop




axiom HasPhysicalForceElement (o : Offense) (c : ComplaintText) : Prop





axiom IsFelonyRiskingPhysicalForce (o : Offense) (c : ComplaintText) : Prop






axiom IsOrganization (p : Person) (c : ComplaintText) : Prop




axiom IsIndividual (p : Person) (c : ComplaintText) : Prop






axiom IsPettyOffense (o : Offense) (c : ComplaintText) : Prop



axiom IsClassBMisdemeanor (o : Offense) (c : ComplaintText) : Prop



axiom IsClassCMisdemeanor (o : Offense) (c : ComplaintText) : Prop



axiom IsInfraction (o : Offense) (c : ComplaintText) : Prop




axiom WithinPettyOffenseFineCap (o : Offense) (c : ComplaintText) : Prop






axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop







axiom IsEnumeratedFinancialInstitutionKind (e : Entity) (c : ComplaintText) : Prop





axiom IsMortgageLendingBusinessOrFederallyRelatedLender (e : Entity) (c : ComplaintText) : Prop








axiom IsStolenOrCounterfeitProperty (pr : Property) (c : ComplaintText) : Prop




axiom WasStolenOrCounterfeited (pr : Property) (c : ComplaintText) : Prop




axiom DefendantKnewStolenCharacter (pr : Property) (c : ComplaintText) : Prop





axiom IsOfficialRepresentation (r : Representation) (c : ComplaintText) : Prop







axiom IsCourtOfTheUnitedStates (crt : Court) (c : ComplaintText) : Prop







axiom IsFederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedHealthCareStatute (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (c : ComplaintText) : Prop





axiom IsHealthCareBenefitProgram (hcbp : HealthCareBenefitProgram) (c : ComplaintText) : Prop






axiom IsMinor (p : Person) (c : ComplaintText) : Prop




axiom UsesMinor (p : Person) (c : ComplaintText) : Prop







axiom IsSeaport (s : Seaport) (c : ComplaintText) : Prop







axiom IsMortgageLendingBusiness (p : Person) (c : ComplaintText) : Prop




axiom FinancesOrRefinancesRealEstateDebt (p : Person) (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop






axiom IsCoveredFederalOffense (o : Offense) (c : ComplaintText) : Prop




axiom IsVictimOfTrafficking (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Part2.Ontology
