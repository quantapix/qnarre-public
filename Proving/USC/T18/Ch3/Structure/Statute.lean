


















import Proving.USC.T18.Ch3.Structure.Types
import Proving.USC.T18.Ch3.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch3.Structure

open Proving.USC.Common








def edge_41_incorporates_3571 : Ref :=
  { source := "18 USC § 41", target := "18 USC § 3571", kind := .Incorporates }



def edge_42_savings_phsa : Ref :=
  { source := "18 USC § 42(a)(1)", target := "Public Health Service Act", kind := .Savings }

def edge_42_savings_ffdca : Ref :=
  { source := "18 USC § 42(a)(1)", target := "Federal Food, Drug, and Cosmetic Act", kind := .Savings }


def edge_42_incorporates_plantpest : Ref :=
  { source := "18 USC § 42(a)(1)", target := "Federal Plant Pest Act", kind := .Incorporates }


def edge_42_notwithstanding_a3 : Ref :=
  { source := "18 USC § 42(a)(3)", target := "18 USC § 42(a)(1)", kind := .Notwithstanding }

def edge_42_except_a4 : Ref :=
  { source := "18 USC § 42(a)(4)", target := "18 USC § 42(a)(1)", kind := .ExceptAsProvided }
def edge_42_incorporates_3571 : Ref :=
  { source := "18 USC § 42(b)", target := "18 USC § 3571", kind := .Incorporates }



def edge_43_incorporates_115 : Ref :=
  { source := "18 USC § 43(a)(2)(B)", target := "18 USC § 115", kind := .Incorporates }

def edge_43_incorporates_3663 : Ref :=
  { source := "18 USC § 43(c)", target := "18 USC § 3663", kind := .Incorporates }

def edge_43_incorporates_3663A : Ref :=
  { source := "18 USC § 43(c)", target := "18 USC § 3663A", kind := .Incorporates }

def edge_43_savings_firstamendment : Ref :=
  { source := "18 USC § 43(e)(1)", target := "U.S. Const. amend. I", kind := .Savings }

def edge_43_savings_nonpreemption : Ref :=
  { source := "18 USC § 43(e)(3)", target := "State or local law", kind := .Savings }
def edge_43_incorporates_3571 : Ref :=
  { source := "18 USC § 43(b)", target := "18 USC § 3571", kind := .Incorporates }


def edge_47_incorporates_3571 : Ref :=
  { source := "18 USC § 47", target := "18 USC § 3571", kind := .Incorporates }




def edge_48_subjectTo_rfra : Ref :=
  { source := "18 USC § 48(d)(4)", target := "42 USC § 2000bb-1", kind := .SubjectTo }

def edge_48_incorporates_1365 : Ref :=
  { source := "18 USC § 48(f)(1)", target := "18 USC § 1365", kind := .Incorporates }

def edge_48_incorporates_2241 : Ref :=
  { source := "18 USC § 48(f)(1)", target := "18 USC § 2241", kind := .Incorporates }

def edge_48_incorporates_2242 : Ref :=
  { source := "18 USC § 48(f)(1)", target := "18 USC § 2242", kind := .Incorporates }


def edge_48_except_d : Ref :=
  { source := "18 USC § 48(d)", target := "18 USC § 48(a)", kind := .ExceptAsProvided }

def edge_48_savings_nonpreemption : Ref :=
  { source := "18 USC § 48(e)", target := "State or local law", kind := .Savings }
def edge_48_incorporates_3571 : Ref :=
  { source := "18 USC § 48(c)", target := "18 USC § 3571", kind := .Incorporates }





def edge_49_incorporates_awa2156 : Ref :=
  { source := "18 USC § 49", target := "7 USC § 2156", kind := .Incorporates }
def edge_49_incorporates_3571 : Ref :=
  { source := "18 USC § 49", target := "18 USC § 3571", kind := .Incorporates }









structure Coherent41 (c : ComplaintText) : Prop where
  fineExists : ReferencedSectionExists edge_41_incorporates_3571 c




structure Coherent42 (c : ComplaintText) : Prop where
  phsaSaved      : SavingsPreserved edge_42_savings_phsa c
  ffdcaSaved     : SavingsPreserved edge_42_savings_ffdca c
  plantPestOk    : IncorporationHonored edge_42_incorporates_plantpest c
  fineExists     : ReferencedSectionExists edge_42_incorporates_3571 c




structure Coherent43 (c : ComplaintText) : Prop where
  familyOk        : IncorporationHonored edge_43_incorporates_115 c
  restitutionOk   : ReferencedSectionExists edge_43_incorporates_3663 c
  restitutionAOk  : ReferencedSectionExists edge_43_incorporates_3663A c
  speechSaved     : SavingsPreserved edge_43_savings_firstamendment c
  stateLawSaved   : SavingsPreserved edge_43_savings_nonpreemption c
  fineExists      : ReferencedSectionExists edge_43_incorporates_3571 c


structure Coherent47 (c : ComplaintText) : Prop where
  fineExists : ReferencedSectionExists edge_47_incorporates_3571 c





structure Coherent48 (c : ComplaintText) : Prop where
  rfraExists      : ReferencedSectionExists edge_48_subjectTo_rfra c
  sbiOk           : IncorporationHonored edge_48_incorporates_1365 c
  s2241Exists     : ReferencedSectionExists edge_48_incorporates_2241 c
  s2242Exists     : ReferencedSectionExists edge_48_incorporates_2242 c
  stateLawSaved   : SavingsPreserved edge_48_savings_nonpreemption c
  fineExists      : ReferencedSectionExists edge_48_incorporates_3571 c



structure Coherent49 (c : ComplaintText) : Prop where
  awaOk       : IncorporationHonored edge_49_incorporates_awa2156 c
  awaExists   : ReferencedSectionExists edge_49_incorporates_awa2156 c
  fineExists  : ReferencedSectionExists edge_49_incorporates_3571 c







inductive ImportationGoverns42 (c : ComplaintText) : Prop where

  | prohibited (h : ReferencedSectionExists edge_42_incorporates_3571 c) :
      ImportationGoverns42 c

  | permittedByOverride (h : OverrideTriggered edge_42_notwithstanding_a3 c) :
      ImportationGoverns42 c

end Proving.USC.T18.Ch3.Structure
