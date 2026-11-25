











import Proving.USC.T18.Ch75.Reslice.Ontology.Types
import Proving.USC.T18.Ch75.Reslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




structure DanglingTerm where
  term      : String
  usedAt    : String
  definedAt : String





def edge_falseStatement_dependsOn_application : DefEdge :=
  { defined := "false statement in an application for passport",
    dependsOn := "application for passport", citeDefine := "18 USC § 1542" }


def edge_application_dependsOn_passport : DefEdge :=
  { defined := "application for passport",
    dependsOn := "passport", citeDefine := "18 USC § 1542" }



def edge_securedPassport_dependsOn_passport : DefEdge :=
  { defined := "passport the issue of which was secured by reason of a false statement",
    dependsOn := "passport", citeDefine := "18 USC § 1542" }


def edge_issuanceRule_dependsOn_issuanceLaws : DefEdge :=
  { defined := "rules prescribed pursuant to the laws regulating the issuance of passports",
    dependsOn := "laws regulating the issuance of passports",
    citeDefine := "18 USC § 1542" }





def edge_purportedInstrument_dependsOn_passport : DefEdge :=
  { defined := "instrument purporting to be a passport",
    dependsOn := "passport", citeDefine := "18 USC § 1543" }



def edge_falsifiedDocument_dependsOn_purportedInstrument : DefEdge :=
  { defined := "false, forged, counterfeited, mutilated, or altered passport or instrument",
    dependsOn := "instrument purporting to be a passport",
    citeDefine := "18 USC § 1543" }


def edge_voidedPassport_dependsOn_validlyIssuedPassport : DefEdge :=
  { defined := "passport validly issued which has become void",
    dependsOn := "passport validly issued", citeDefine := "18 USC § 1543" }



def edge_voidedPassport_dependsOn_prescribedCondition : DefEdge :=
  { defined := "passport validly issued which has become void",
    dependsOn := "condition therein prescribed invalidating the same",
    citeDefine := "18 USC § 1543" }





def edge_passportOfAnother_dependsOn_passport : DefEdge :=
  { defined := "passport issued or designed for the use of another",
    dependsOn := "passport", citeDefine := "18 USC § 1544" }


def edge_conditionsRestrictions_dependsOn_passport : DefEdge :=
  { defined := "conditions or restrictions therein contained",
    dependsOn := "passport", citeDefine := "18 USC § 1544" }


def edge_s1544Rules_dependsOn_issuanceRule : DefEdge :=
  { defined := "rules prescribed pursuant to the laws regulating the issuance of passports (as used in § 1544)",
    dependsOn := "rules prescribed pursuant to the laws regulating the issuance of passports",
    citeDefine := "18 USC § 1542" }






def edge_entryDocument_dependsOn_prescribedDocument : DefEdge :=
  { defined := "immigrant or nonimmigrant visa, permit, border crossing card, alien registration receipt card, or other document",
    dependsOn := "document prescribed by statute or regulation for entry into or as evidence of authorized stay or employment in the United States",
    citeDefine := "18 USC § 1546(a)" }


def edge_blankPermit_dependsOn_permit : DefEdge :=
  { defined := "blank permit", dependsOn := "permit",
    citeDefine := "18 USC § 1546(a)" }



def edge_plate_dependsOn_permit : DefEdge :=
  { defined := "plate in the likeness of a plate designed for the printing of permits",
    dependsOn := "permit", citeDefine := "18 USC § 1546(a)" }



def edge_likenessImpression_dependsOn_entryDocument : DefEdge :=
  { defined := "print, photograph, or impression in the likeness of a visa, permit or other document required for entry",
    dependsOn := "immigrant or nonimmigrant visa, permit, border crossing card, alien registration receipt card, or other document",
    citeDefine := "18 USC § 1546(a)" }


def edge_distinctivePaper_dependsOn_properOfficer : DefEdge :=
  { defined := "distinctive paper adopted for the printing of such visas, permits, or documents",
    dependsOn := "Attorney General or Commissioner of the Immigration and Naturalization Service",
    citeDefine := "18 USC § 1546(a)" }



def edge_materialFalseStatement_dependsOn_immigrationFiling : DefEdge :=
  { defined := "false statement with respect to a material fact",
    dependsOn := "application, affidavit, or other document required by the immigration laws",
    citeDefine := "18 USC § 1546(a)" }





def edge_unlawfullyHeldDocument_dependsOn_identificationDocument : DefEdge :=
  { defined := "identification document not issued lawfully for the use of the possessor",
    dependsOn := "identification document", citeDefine := "18 USC § 1546(b)" }


def edge_falseDocument_dependsOn_identificationDocument : DefEdge :=
  { defined := "identification document that is false",
    dependsOn := "identification document", citeDefine := "18 USC § 1546(b)" }




def edge_state_dependsOn_stateOfTheUnitedStates : DefEdge :=
  { defined := "State", dependsOn := "State of the United States",
    citeDefine := "18 USC § 1546(c)" }


def edge_state_dependsOn_districtOfColumbia : DefEdge :=
  { defined := "State", dependsOn := "District of Columbia",
    citeDefine := "18 USC § 1546(c)" }


def edge_state_dependsOn_commonwealthTerritoryOrPossession : DefEdge :=
  { defined := "State",
    dependsOn := "commonwealth, territory, or possession of the United States",
    citeDefine := "18 USC § 1546(c)" }


def edge_subdivision_dependsOn_state : DefEdge :=
  { defined := "subdivision of a State", dependsOn := "State",
    citeDefine := "18 USC § 1546(c)" }



def edge_lawEnforcementAgency_dependsOn_state : DefEdge :=
  { defined := "law enforcement agency of a State, or a subdivision of a State",
    dependsOn := "State", citeDefine := "18 USC § 1546(c)" }


def edge_authorizedActivity_dependsOn_agency : DefEdge :=
  { defined := "lawfully authorized investigative, protective, or intelligence activity",
    dependsOn := "law enforcement agency or intelligence agency",
    citeDefine := "18 USC § 1546(c)" }





def edge_internationalTerrorism_dependsOn_s2331 : DefEdge :=
  { defined := "act of international terrorism",
    dependsOn := "international terrorism (18 USC § 2331)",
    citeDefine := "18 USC § 2331" }



def edge_drugTraffickingCrime_dependsOn_s929a : DefEdge :=
  { defined := "drug trafficking crime",
    dependsOn := "drug trafficking crime (18 USC § 929(a))",
    citeDefine := "18 USC § 929(a)" }



def edge_penaltyOfPerjury_dependsOn_t28s1746 : DefEdge :=
  { defined := "as permitted under penalty of perjury",
    dependsOn := "unsworn declaration under penalty of perjury (28 USC § 1746)",
    citeDefine := "28 USC § 1746" }


def edge_verificationPurpose_dependsOn_ina274Ab : DefEdge :=
  { defined := "requirement of section 274A(b) of the Immigration and Nationality Act",
    dependsOn := "section 274A(b) of the Immigration and Nationality Act",
    citeDefine := "Immigration and Nationality Act § 274A(b)" }




def dangling_passport : DanglingTerm :=
  { term := "passport", usedAt := "18 USC §§ 1542, 1543, 1544",
    definedAt := "unknown (no definition in this slice)" }


def dangling_passportIssuanceLaws : DanglingTerm :=
  { term := "laws regulating the issuance of passports",
    usedAt := "18 USC §§ 1542, 1544",
    definedAt := "unknown (no definition in this slice)" }


def dangling_identificationDocument : DanglingTerm :=
  { term := "identification document", usedAt := "18 USC § 1546(b)",
    definedAt := "unknown (no definition in this slice)" }



def dangling_attestation : DanglingTerm :=
  { term := "attestation", usedAt := "18 USC § 1546(b)(3)",
    definedAt := "unknown (no definition in this slice)" }


def dangling_actOfInternationalTerrorism : DanglingTerm :=
  { term := "act of international terrorism",
    usedAt := "18 USC §§ 1542, 1543, 1544, 1546(a)",
    definedAt := "18 USC § 2331 (outside this slice)" }


def dangling_drugTraffickingCrime : DanglingTerm :=
  { term := "drug trafficking crime",
    usedAt := "18 USC §§ 1542, 1543, 1544, 1546(a)",
    definedAt := "18 USC § 929(a) (outside this slice)" }




def dangling_titleVOcca : DanglingTerm :=
  { term := "activity authorized under title V of the Organized Crime Control Act of 1970",
    usedAt := "18 USC § 1546(c)",
    definedAt := "18 U.S.C. note prec. 3481 (References in Text note; outside this slice)" }



def dangling_ina274Ab : DanglingTerm :=
  { term := "requirement of section 274A(b) of the Immigration and Nationality Act",
    usedAt := "18 USC § 1546(b)",
    definedAt := "Immigration and Nationality Act § 274A(b) (outside this slice)" }



def dangling_immigrationLaws : DanglingTerm :=
  { term := "immigration laws", usedAt := "18 USC § 1546(a)",
    definedAt := "unknown (no definition in this slice)" }


def dangling_materialFact : DanglingTerm :=
  { term := "material fact", usedAt := "18 USC § 1546(a)",
    definedAt := "unknown (no definition in this slice)" }


def dangling_properOfficer : DanglingTerm :=
  { term := "other proper officer", usedAt := "18 USC § 1546(a)",
    definedAt := "unknown (no definition in this slice)" }






structure PassportApplicationStatementMembership (s : Statement)
    (ap : PassportApplication) (c : ComplaintText) : Prop where
  application : IsPassportApplication ap c
  falseInIt   : IsFalseStatementInApplication s ap c




structure FraudulentlySecuredPassportMembership (pp : Passport)
    (c : ComplaintText) : Prop where
  passport : IsPassport pp c
  secured  : IsPassportSecuredByFalseStatement pp c



structure PurportedPassportMembership (pp : Passport)
    (c : ComplaintText) : Prop where
  purports   : IsInstrumentPurportingToBePassport pp c
  notGenuine : ¬ IsPassport pp c





inductive FalsifiedPassportDocumentMembership (pp : Passport)
    (c : ComplaintText) : Prop where
  | genuinePassport (hPassport : IsPassport pp c)
      (hFalsified : IsFalselyMadeOrAlteredPassport pp c)
  | purportedInstrument (hPurported : PurportedPassportMembership pp c)
      (hFalsified : IsFalselyMadeOrAlteredPassport pp c)




structure VoidedPassportMembership (pp : Passport) (t : Time)
    (c : ComplaintText) : Prop where
  passport      : IsPassport pp c
  validlyIssued : IsValidlyIssuedPassport pp c
  voided        : IsVoidedByPrescribedCondition pp t c



structure PassportOfAnotherMembership (pp : Passport) (bearer : Person)
    (user : Person) (c : ComplaintText) : Prop where
  passport   : IsPassport pp c
  designated : IsPassportOfAnother pp bearer c
  another    : user ≠ bearer




inductive PassportUseNormMembership (r : PassportRule) (pp : Passport)
    (c : ComplaintText) : Prop where
  | conditionInPassport (h : IsConditionOrRestrictionInPassport r pp c)
  | prescribedRule (h : IsPassportIssuanceRule r c)



inductive EntryDocumentMembership (d : EntryDocument)
    (c : ComplaintText) : Prop where
  | visa (h : IsImmigrantOrNonimmigrantVisa d c)
  | permit (h : IsPermit d c)
  | borderCrossingCard (h : IsBorderCrossingCard d c)
  | alienRegistrationReceiptCard (h : IsAlienRegistrationReceiptCard d c)
  | otherPrescribed (h : IsPrescribedEntryOrStayDocument d c)


structure BlankPermitMembership (d : EntryDocument)
    (c : ComplaintText) : Prop where
  permit : IsPermit d c
  blank  : IsBlankPermit d c



inductive CounterfeitingImplementMembership (i : Implement)
    (c : ComplaintText) : Prop where
  | plate (h : IsPlateForPrintingPermits i c)
  | likenessImpression (h : IsLikenessImpressionOfEntryDocument i c)
  | distinctivePaper (h : IsDistinctivePaperAdoptedForPrinting i c)




inductive ProperOfficerMembership (p : Person) (c : ComplaintText) : Prop where
  | attorneyGeneral (h : IsAttorneyGeneral p c)
  | commissioner (h : IsCommissionerOfImmigrationAndNaturalization p c)
  | otherProperOfficer (h : IsOtherProperOfficer p c)




structure MaterialFalseStatementMembership (s : Statement)
    (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  filing   : IsImmigrationFiling f c
  material : IsStatementOfMaterialFact s f c




inductive EmploymentVerificationObjectMembership (c : ComplaintText) : Prop where
  | notLawfullyIssued (d : IdentificationDocument) (p : Person)
      (hDoc : IsIdentificationDocument d c)
      (hNotIssued : ¬ IsLawfullyIssuedForPossessor d p c)
  | falseDocument (d : IdentificationDocument)
      (hDoc : IsIdentificationDocument d c)
      (hFalse : IsFalseIdentificationDocument d c)
  | falseAttestation (a : Attestation) (hFalse : IsFalseAttestation a c)



inductive StateMembership (j : Jurisdiction) (c : ComplaintText) : Prop where
  | stateOfTheUnitedStates (h : IsStateOfTheUnitedStates j c)
  | districtOfColumbia (h : IsDistrictOfColumbia j c)
  | commonwealthTerritoryOrPossession (h : IsCommonwealthTerritoryOrPossession j c)



inductive ExemptAgencyMembership (e : Entity) (c : ComplaintText) : Prop where
  | federalLawEnforcement (h : IsLawEnforcementAgencyOfUnitedStates e c)
  | stateLawEnforcement (j : Jurisdiction) (hState : StateMembership j c)
      (h : IsLawEnforcementAgencyOfState e j c)
  | subdivisionLawEnforcement (sub : Jurisdiction) (st : Jurisdiction)
      (hState : StateMembership st c) (hSub : IsSubdivisionOfState sub st c)
      (h : IsLawEnforcementAgencyOfState e sub c)
  | federalIntelligence (h : IsIntelligenceAgencyOfUnitedStates e c)




inductive AuthorizedActivityMembership (a : Act) (e : Entity)
    (c : ComplaintText) : Prop where
  | investigative (hAgency : ExemptAgencyMembership e c)
      (hAuthorized : IsLawfullyAuthorized a e c) (h : IsInvestigativeActivity a c)
  | protective (hAgency : ExemptAgencyMembership e c)
      (hAuthorized : IsLawfullyAuthorized a e c) (h : IsProtectiveActivity a c)
  | intelligence (hAgency : ExemptAgencyMembership e c)
      (hAuthorized : IsLawfullyAuthorized a e c) (h : IsIntelligenceActivity a c)
  | titleVOcca (h : IsTitleVOccaActivity a c)




inductive FacilitationObjectMembership (a : Act) (c : ComplaintText) : Prop where
  | internationalTerrorism (h : IsActOfInternationalTerrorism a c)
  | drugTraffickingCrime (h : IsDrugTraffickingCrime a c)

end Proving.USC.T18.Ch75.Reslice.Ontology
