







import Proving.USC.T18.Ch13.Reearn.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Deontic

open Proving.USC.Common





axiom AddresseeIsUnitedStatesProsecutor245a1 (pr : Prosecution) (c : ComplaintText) : Prop




axiom RegulatedActOccurred245a1 (pr : Prosecution) (c : ComplaintText) : Prop





axiom CertificationRequirementSatisfied245a1 (pr : Prosecution) (c : ComplaintText) : Prop





axiom AddresseeIsFederalInvestigator245a2 (p : Person) (c : ComplaintText) : Prop



axiom InvestigationOfSuspectedViolation245a2 (p : Person) (c : ComplaintText) : Prop






axiom AddresseeInClass245b (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurred245b (p : Person) (v : Person) (c : ComplaintText) : Prop






axiom FederalElectoralOrBenefitNexus245b1
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop







axiom RacialOrReligiousStatusNexus245b2
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom RiotOrCivilDisorderCommerceNexus245b3
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom NondiscriminatoryParticipationNexus245b4
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop







axiom CitizenEncouragementNexus245b5
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom LawEnforcementDutyExemption245c (p : Person) (c : ComplaintText) : Prop







axiom SmallLodgingProprietorExemption245b
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom AddresseeInClass247a (p : Person) (c : ComplaintText) : Prop





axiom RegulatedActOccurred247a1
    (p : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop





axiom RegulatedActOccurred247a2
    (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom InterstateOrForeignCommerceCircumstance247b (c : ComplaintText) : Prop





axiom AddresseeInClass247c (p : Person) (c : ComplaintText) : Prop





axiom RegulatedActOccurred247c
    (p : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop






axiom AddresseeIsUnitedStatesProsecutor247e (pr : Prosecution) (c : ComplaintText) : Prop




axiom RegulatedActOccurred247e (pr : Prosecution) (c : ComplaintText) : Prop




axiom CertificationRequirementSatisfied247e (pr : Prosecution) (c : ComplaintText) : Prop






axiom NoncapitalProsecutionUndertaken247g (pr : Prosecution) (c : ComplaintText) : Prop




axiom ChargedWithinSevenYears247g (pr : Prosecution) (c : ComplaintText) : Prop





axiom AddresseeInClass248a (p : Person) (c : ComplaintText) : Prop






axiom ReproductiveHealthServicesInterference248a1
    (p : Person) (v : Person) (c : ComplaintText) : Prop






axiom ReligiousExerciseInterference248a2
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom ProtectedPropertyDamage248a3
    (p : Person) (f : Facility) (c : ComplaintText) : Prop





axiom ParentalGuardianExemption248a
    (p : Person) (v : Person) (c : ComplaintText) : Prop






axiom FirstAmendmentProtectedExpressiveConduct248d1
    (p : Person) (c : ComplaintText) : Prop






axiom AggrievedByProhibitedConduct248c1 (v : Person) (c : ComplaintText) : Prop









axiom StandingLimitationSatisfied248c1 (v : Person) (c : ComplaintText) : Prop



axiom CivilActionCommenced248c1
    (v : Person) (ca : CivilAction) (c : ComplaintText) : Prop




axiom AdjudicatingCourtInAction248c1b (ca : CivilAction) (c : ComplaintText) : Prop





axiom ReliefAwardAuthorized248c1b (ca : CivilAction) (c : ComplaintText) : Prop





axiom AttorneyGeneralReasonableCause248c2 (c : ComplaintText) : Prop




axiom UnitedStatesCivilActionCommenced248c2 (ca : CivilAction) (c : ComplaintText) : Prop





axiom StateAttorneyGeneralReasonableCause248c3 (c : ComplaintText) : Prop





axiom StateParensPatriaeActionCommenced248c3 (ca : CivilAction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reearn.Deontic
