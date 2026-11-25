import Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology.Predicates

set_option autoImplicit false
open Proving.USC.Common

















namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology




structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool




def edge_immediateFamily_115 : DefEdge :=
  { defined := "immediate family (§119)", dependsOn := "immediate family member (§115)",
    citeDefine := "18 USC § 119(b)(4)", dangling := false }


def edge_weapon_biologicalAgent : DefEdge :=
  { defined := "for use as a weapon", dependsOn := "biological agent",
    citeDefine := "18 USC § 175(c)", dangling := false }
def edge_weapon_toxin : DefEdge :=
  { defined := "for use as a weapon", dependsOn := "toxin",
    citeDefine := "18 USC § 175(c)", dangling := false }
def edge_weapon_deliverySystem : DefEdge :=
  { defined := "for use as a weapon", dependsOn := "delivery system",
    citeDefine := "18 USC § 175(c)", dangling := false }

def edge_selectAgent_biologicalAgent : DefEdge :=
  { defined := "select agent", dependsOn := "biological agent",
    citeDefine := "18 USC § 175b(d)(1)", dangling := false }
def edge_selectAgent_toxin : DefEdge :=
  { defined := "select agent", dependsOn := "toxin",
    citeDefine := "18 USC § 175b(d)(1)", dangling := false }

def edge_deliverySystem_vector : DefEdge :=
  { defined := "delivery system", dependsOn := "vector",
    citeDefine := "18 USC § 178(3)", dangling := false }
def edge_deliverySystem_biologicalAgent : DefEdge :=
  { defined := "delivery system", dependsOn := "biological agent",
    citeDefine := "18 USC § 178(3)", dangling := false }
def edge_deliverySystem_toxin : DefEdge :=
  { defined := "delivery system", dependsOn := "toxin",
    citeDefine := "18 USC § 178(3)", dangling := false }

def edge_vector_biologicalAgent : DefEdge :=
  { defined := "vector", dependsOn := "biological agent",
    citeDefine := "18 USC § 178(4)", dangling := false }
def edge_vector_toxin : DefEdge :=
  { defined := "vector", dependsOn := "toxin",
    citeDefine := "18 USC § 178(4)", dangling := false }


def edge_preparer_documentForFiling : DefEdge :=
  { defined := "bankruptcy petition preparer", dependsOn := "document for filing",
    citeDefine := "18 USC § 156(a)(1)", dangling := false }
def edge_preparer_debtor : DefEdge :=
  { defined := "bankruptcy petition preparer", dependsOn := "debtor",
    citeDefine := "18 USC § 156(a)(1)", dangling := false }

def edge_documentForFiling_debtor : DefEdge :=
  { defined := "document for filing", dependsOn := "debtor",
    citeDefine := "18 USC § 156(a)(2)", dangling := false }



def edge_covered_designated1114 : DefEdge :=
  { defined := "covered person", dependsOn := "person designated in § 1114",
    citeDefine := "18 USC § 119(b)(2)(A)", dangling := true }
def edge_119_crimeOfViolence : DefEdge :=
  { defined := "restricted-info offense (§119)", dependsOn := "crime of violence (§16)",
    citeDefine := "18 USC § 119(b)(3)", dangling := true }
def edge_115_seriousBodilyInjury : DefEdge :=
  { defined := "assault-on-family grade (§115)", dependsOn := "serious bodily injury (§1365)",
    citeDefine := "18 USC § 115(b)(1)(B)(iv)", dangling := true }
def edge_113_seriousBodilyInjury : DefEdge :=
  { defined := "serious bodily injury (§113)", dependsOn := "serious bodily injury (§1365)",
    citeDefine := "18 USC § 113(b)(2)", dangling := true }
def edge_113_datingPartner : DefEdge :=
  { defined := "dating partner / spouse-or-intimate-partner (§113)",
    dependsOn := "definitions in § 2266", citeDefine := "18 USC § 113(b)(3)", dangling := true }
def edge_112_foreignOfficial : DefEdge :=
  { defined := "foreign official / official guest / IPP (§112)",
    dependsOn := "definitions in § 1116(b)", citeDefine := "18 USC § 112(c)", dangling := true }
def edge_114_torture : DefEdge :=
  { defined := "maiming intent (§114)", dependsOn := "torture (§2340)",
    citeDefine := "18 USC § 114", dangling := true }
def edge_domesticAssault_assault : DefEdge :=
  { defined := "domestic assault", dependsOn := "assault (common law; undefined in slice)",
    citeDefine := "18 USC § 117(b)", dangling := true }
def edge_debtor_title11 : DefEdge :=
  { defined := "debtor", dependsOn := "petition under title 11",
    citeDefine := "18 USC § 151", dangling := true }
def edge_restrictedPerson_alien : DefEdge :=
  { defined := "restricted person", dependsOn := "alien (8 USC 1101(a)(3))",
    citeDefine := "18 USC § 175b(d)(3)", dangling := true }
def edge_178_national : DefEdge :=
  { defined := "national of the United States (§178)",
    dependsOn := "national of the United States (8 USC 1101(a)(22))",
    citeDefine := "18 USC § 178(5)", dangling := true }
def edge_81_smtj : DefEdge :=
  { defined := "arson jurisdiction (§81)",
    dependsOn := "special maritime and territorial jurisdiction (§7)",
    citeDefine := "18 USC § 81", dangling := true }




inductive FemaleGenitalMutilationForm where
  | clitoridectomy
  | excision
  | infibulation
  | otherHarmful


inductive CoveredPersonCategory where
  | designatedOfficial
  | courtOfficer
  | federalInformantWitness
  | stateLocalAssistant


inductive RestrictedPersonStatus where
  | underIndictment
  | convictedFelon
  | fugitive
  | unlawfulDrugUser
  | illegalAlien
  | mentalDefective
  | terrorStateNational
  | dishonorableDischarge
  | terroristOrgMember


inductive BiologicalAgentCapability where
  | harmsLiving
  | deterioratesMateriel
  | altersEnvironment


inductive DeliverySystemForm where
  | designedDeliverer
  | vectorForm





structure WeaponizedAgent (s : Substance) (c : ComplaintText) : Prop where
  isAgent   : IsBiologicalAgent s c
  forWeapon : IsForUseAsAWeapon s c


structure SelectAgentComposition (s : Substance) (c : ComplaintText) : Prop where
  isAgent  : IsBiologicalAgent s c
  isSelect : IsSelectAgent s c


structure VectorMembership (v : Instrumentality) (s : Substance) (c : ComplaintText) : Prop where
  carriesAgent : IsBiologicalAgent s c
  isVector     : IsVector v c


structure DeliveryViaVector (x : Instrumentality) (c : ComplaintText) : Prop where
  isVector      : IsVector x c
  isDeliverySys : IsDeliverySystem x c


structure PreparerMembership (p : Person) (d : Document) (c : ComplaintText) : Prop where
  isDocument : IsDocumentForFiling d c
  isPreparer : IsBankruptcyPetitionPreparer p c


structure FilingByDebtor (d : Document) (p : Person) (c : ComplaintText) : Prop where
  isDebtor   : IsDebtor p c
  isDocument : IsDocumentForFiling d c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology
