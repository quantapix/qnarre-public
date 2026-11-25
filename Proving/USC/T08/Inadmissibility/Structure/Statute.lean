









import Proving.USC.T08.Inadmissibility.Structure.Predicates

namespace Proving.USC.T08.Inadmissibility.Structure

open Proving.USC.Common




def edge_1182_excepts_chapter : Ref :=
  { source := "8 USC § 1182(a)", target := "8 USC ch. 12", kind := .ExceptAsProvided }

def edge_1182_incorporates_21_802 : Ref :=
  { source := "8 USC § 1182(a)(2)", target := "21 USC § 802", kind := .Incorporates }

def edge_1182_incorporates_22_6402 : Ref :=
  { source := "8 USC § 1182(a)(2)(G)", target := "22 USC § 6402", kind := .Incorporates }

def edge_1182_incorporates_22_7102 : Ref :=
  { source := "8 USC § 1182(a)(2)(H)", target := "22 USC § 7102", kind := .Incorporates }

def edge_1182_incorporates_18_1956 : Ref :=
  { source := "8 USC § 1182(a)(2)(I)", target := "18 USC § 1956", kind := .Incorporates }

def edge_1182_incorporates_18_2339D : Ref :=
  { source := "8 USC § 1182(a)(3)(B)", target := "18 USC § 2339D", kind := .Incorporates }

def edge_1182_incorporates_18_1091 : Ref :=
  { source := "8 USC § 1182(a)(3)(E)", target := "18 USC § 1091", kind := .Incorporates }

def edge_1182_incorporates_18_2340 : Ref :=
  { source := "8 USC § 1182(a)(3)(E)", target := "18 USC § 2340", kind := .Incorporates }

def edge_1182_incorporates_18_2442 : Ref :=
  { source := "8 USC § 1182(a)(3)(G)", target := "18 USC § 2442", kind := .Incorporates }

def edge_1182_incorporates_08_1189 : Ref :=
  { source := "8 USC § 1182(a)(3)(B)", target := "8 USC § 1189", kind := .Incorporates }

def edge_1182_incorporates_08_1183a : Ref :=
  { source := "8 USC § 1182(a)(4)", target := "8 USC § 1183a", kind := .Incorporates }


def edge_1182_incorporates_08_1324a : Ref :=
  { source := "8 USC § 1182(a)(6)(C)", target := "8 USC § 1324a", kind := .Incorporates }

def edge_1182_subjectTo_1182r : Ref :=
  { source := "8 USC § 1182(a)(5)(C)", target := "8 USC § 1182(r)", kind := .SubjectTo }

def edge_1182_exceptAsProvided_g : Ref :=
  { source := "8 USC § 1182(a)(1)", target := "8 USC § 1182(g)", kind := .ExceptAsProvided }

def edge_1182_exceptAsProvided_h : Ref :=
  { source := "8 USC § 1182(a)(2)", target := "8 USC § 1182(h)", kind := .ExceptAsProvided }


def edge_1182_notwithstanding_28_2241 : Ref :=
  { source := "8 USC § 1182(d)(3)(B)", target := "28 USC § 2241", kind := .Notwithstanding }




def edge_1324a_incorporates_internal_h3 : Ref :=
  { source := "8 USC § 1324a(a)(1)", target := "8 USC § 1324a(h)(3)", kind := .Incorporates }

def edge_1324a_incorporates_29_1802 : Ref :=
  { source := "8 USC § 1324a(a)(1)(B)", target := "29 USC § 1802", kind := .Incorporates }


def edge_1324a_incorporates_18_1546 : Ref :=
  { source := "8 USC § 1324a(b)(5)", target := "18 USC § 1546", kind := .Incorporates }


def edge_1324a_incorporates_05_554 : Ref :=
  { source := "8 USC § 1324a(e)(3)(B)", target := "5 USC § 554", kind := .Incorporates }

def edge_1324a_affirmativeDefense_b : Ref :=
  { source := "8 USC § 1324a(a)(3)", target := "8 USC § 1324a(b)", kind := .ExceptAsProvided }


def edge_1324a_exceptAsProvided_b6 : Ref :=
  { source := "8 USC § 1324a(b)(6)(A)", target := "8 USC § 1324a(b)(6)(B)", kind := .ExceptAsProvided }


def edge_1324a_notwithstanding_b4 : Ref :=
  { source := "8 USC § 1324a(b)(4)", target := "any other provision of law", kind := .Notwithstanding }


def edge_1324a_notwithstanding_f1 : Ref :=
  { source := "8 USC § 1324a(f)(1)", target := "any other Federal law (fine levels)", kind := .Notwithstanding }


def edge_1324a_lexSpecialis_preempt_h2 : Ref :=
  { source := "8 USC § 1324a(h)(2)", target := "State or local sanction law", kind := .LexSpecialis }






structure Coherent1182 (c : ComplaintText) : Prop where
  controlledSubstanceDef : IncorporationHonored edge_1182_incorporates_21_802 c
  traffickingDef         : IncorporationHonored edge_1182_incorporates_22_7102 c
  moneyLaunderingRef     : ReferencedSectionExists edge_1182_incorporates_18_1956 c
  terrorOrgDesignation   : ReferencedSectionExists edge_1182_incorporates_08_1189 c
  affidavitOfSupportRef  : ReferencedSectionExists edge_1182_incorporates_08_1183a c
  employerVerifyLink     : ReferencedSectionExists edge_1182_incorporates_08_1324a c
  healthcareSubjectTo    : ReferencedSectionExists edge_1182_subjectTo_1182r c




structure Coherent1324a (c : ComplaintText) : Prop where
  unauthorizedAlienDef : IncorporationHonored edge_1324a_incorporates_internal_h3 c
  agriculturalAssocDef : IncorporationHonored edge_1324a_incorporates_29_1802 c
  apaHearingRef        : ReferencedSectionExists edge_1324a_incorporates_05_554 c
  fraudEnforcementRef  : ReferencedSectionExists edge_1324a_incorporates_18_1546 c
  goodFaithDefense     : ExceptionApplies edge_1324a_affirmativeDefense_b c





inductive Override1324a (c : ComplaintText) : Prop
  | copyDocuments   (h : OverrideTriggered edge_1324a_notwithstanding_b4 c) : Override1324a c
  | patternPractice (h : OverrideTriggered edge_1324a_notwithstanding_f1 c) : Override1324a c
  | statePreemption (h : OverrideTriggered edge_1324a_lexSpecialis_preempt_h2 c) : Override1324a c

end Proving.USC.T08.Inadmissibility.Structure
