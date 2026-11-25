







import Proving.USC.T18.Ch75.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Ontology

open Proving.USC.Common







axiom IsPassport (pp : Passport) (c : ComplaintText) : Prop



axiom IsPassportApplication (ap : PassportApplication) (c : ComplaintText) : Prop




axiom IsPassportIssuanceRule (r : PassportRule) (c : ComplaintText) : Prop




axiom IsFalseStatementInApplication (s : Statement) (ap : PassportApplication)
    (c : ComplaintText) : Prop




axiom IsPassportSecuredByFalseStatement (pp : Passport) (c : ComplaintText) : Prop





axiom IsInstrumentPurportingToBePassport (pp : Passport) (c : ComplaintText) : Prop




axiom IsFalselyMadeOrAlteredPassport (pp : Passport) (c : ComplaintText) : Prop



axiom IsValidlyIssuedPassport (pp : Passport) (c : ComplaintText) : Prop





axiom IsVoidedByPrescribedCondition (pp : Passport) (t : Time)
    (c : ComplaintText) : Prop






axiom IsPassportOfAnother (pp : Passport) (bearer : Person)
    (c : ComplaintText) : Prop




axiom IsConditionOrRestrictionInPassport (r : PassportRule) (pp : Passport)
    (c : ComplaintText) : Prop







axiom IsPrescribedEntryOrStayDocument (d : EntryDocument)
    (c : ComplaintText) : Prop



axiom IsImmigrantOrNonimmigrantVisa (d : EntryDocument) (c : ComplaintText) : Prop



axiom IsPermit (d : EntryDocument) (c : ComplaintText) : Prop



axiom IsBlankPermit (d : EntryDocument) (c : ComplaintText) : Prop



axiom IsBorderCrossingCard (d : EntryDocument) (c : ComplaintText) : Prop



axiom IsAlienRegistrationReceiptCard (d : EntryDocument) (c : ComplaintText) : Prop






axiom IsPlateForPrintingPermits (i : Implement) (c : ComplaintText) : Prop





axiom IsLikenessImpressionOfEntryDocument (i : Implement)
    (c : ComplaintText) : Prop






axiom IsDistinctivePaperAdoptedForPrinting (i : Implement)
    (c : ComplaintText) : Prop





axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom IsCommissionerOfImmigrationAndNaturalization (p : Person)
    (c : ComplaintText) : Prop




axiom IsOtherProperOfficer (p : Person) (c : ComplaintText) : Prop







axiom IsImmigrationFiling (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom IsStatementOfMaterialFact (s : Statement) (f : ImmigrationFiling)
    (c : ComplaintText) : Prop






axiom IsIdentificationDocument (d : IdentificationDocument)
    (c : ComplaintText) : Prop




axiom IsLawfullyIssuedForPossessor (d : IdentificationDocument) (p : Person)
    (c : ComplaintText) : Prop



axiom IsFalseIdentificationDocument (d : IdentificationDocument)
    (c : ComplaintText) : Prop



axiom IsFalseAttestation (a : Attestation) (c : ComplaintText) : Prop






axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsStateOfTheUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsCommonwealthTerritoryOrPossession (j : Jurisdiction)
    (c : ComplaintText) : Prop



axiom IsSubdivisionOfState (sub : Jurisdiction) (st : Jurisdiction)
    (c : ComplaintText) : Prop




axiom IsLawEnforcementAgencyOfUnitedStates (e : Entity)
    (c : ComplaintText) : Prop




axiom IsLawEnforcementAgencyOfState (e : Entity) (j : Jurisdiction)
    (c : ComplaintText) : Prop




axiom IsIntelligenceAgencyOfUnitedStates (e : Entity) (c : ComplaintText) : Prop




axiom IsLawfullyAuthorized (a : Act) (e : Entity) (c : ComplaintText) : Prop



axiom IsInvestigativeActivity (a : Act) (c : ComplaintText) : Prop



axiom IsProtectiveActivity (a : Act) (c : ComplaintText) : Prop



axiom IsIntelligenceActivity (a : Act) (c : ComplaintText) : Prop






axiom IsTitleVOccaActivity (a : Act) (c : ComplaintText) : Prop







axiom IsActOfInternationalTerrorism (a : Act) (c : ComplaintText) : Prop





axiom IsDrugTraffickingCrime (a : Act) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Reslice.Ontology
