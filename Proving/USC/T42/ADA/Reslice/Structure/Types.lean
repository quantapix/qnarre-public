





import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Structure

open Proving.USC.Common





inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr






structure Ref where
  source   : String
  target   : String
  kind     : EdgeKind
  internal : Bool
  deriving DecidableEq, Repr



structure BorrowedTerm where
  name      : String
  definedIn : String
  deriving DecidableEq, Repr




def termDisability : BorrowedTerm :=
  { name := "disability", definedIn := "42 USC § 12102" }


def termCoveredEntity : BorrowedTerm :=
  { name := "covered entity", definedIn := "42 USC § 12111" }


def termQualifiedIndividual : BorrowedTerm :=
  { name := "qualified individual", definedIn := "42 USC § 12111" }


def termReasonableAccommodation : BorrowedTerm :=
  { name := "reasonable accommodation", definedIn := "42 USC § 12111" }


def termUndueHardship : BorrowedTerm :=
  { name := "undue hardship", definedIn := "42 USC § 12111" }





def edgeIncorporates12102 : Ref :=
  { source := "42 USC § 12112(a)", target := "42 USC § 12102",
    kind := .Incorporates, internal := false }



def edgeIncorporates12111 : Ref :=
  { source := "42 USC § 12112(a)", target := "42 USC § 12111",
    kind := .Incorporates, internal := false }



def edgeIncorporates12111Accommodation : Ref :=
  { source := "42 USC § 12112(b)(5)", target := "42 USC § 12111",
    kind := .Incorporates, internal := false }




def edgeSubchapterScopeB2 : Ref :=
  { source := "42 USC § 12112(b)(2)", target := "42 USC ch. 126, subch. I",
    kind := .Incorporates, internal := false }



def edgeSubchapterScopeD3C : Ref :=
  { source := "42 USC § 12112(d)(3)(C)", target := "42 USC ch. 126, subch. I",
    kind := .Incorporates, internal := false }




def edgeChapterScopeD3Biii : Ref :=
  { source := "42 USC § 12112(d)(3)(B)(iii)", target := "42 USC ch. 126",
    kind := .Incorporates, internal := false }




def edgeInternalBtoA : Ref :=
  { source := "42 USC § 12112(b)", target := "42 USC § 12112(a)",
    kind := .Incorporates, internal := true }



def edgeInternalD1toA : Ref :=
  { source := "42 USC § 12112(d)(1)", target := "42 USC § 12112(a)",
    kind := .Incorporates, internal := true }



def edgeInternalC2CtoC2 : Ref :=
  { source := "42 USC § 12112(c)(2)(C)", target := "42 USC § 12112(c)(2)",
    kind := .Incorporates, internal := true }






def edgeExceptAtoC1 : Ref :=
  { source := "42 USC § 12112(a)", target := "42 USC § 12112(c)(1)",
    kind := .ExceptAsProvided, internal := true }




def edgeExceptAtoC2B : Ref :=
  { source := "42 USC § 12112(a)", target := "42 USC § 12112(c)(2)(B)",
    kind := .ExceptAsProvided, internal := true }



def edgeExceptD2AtoD3 : Ref :=
  { source := "42 USC § 12112(d)(2)(A)", target := "42 USC § 12112(d)(3)",
    kind := .ExceptAsProvided, internal := true }




def edgeExceptD2AtoD2B : Ref :=
  { source := "42 USC § 12112(d)(2)(A)", target := "42 USC § 12112(d)(2)(B)",
    kind := .ExceptAsProvided, internal := true }




def edgeExceptD4AtoD4B : Ref :=
  { source := "42 USC § 12112(d)(4)(A)", target := "42 USC § 12112(d)(4)(B)",
    kind := .ExceptAsProvided, internal := true }






def edgeSubjectToD4CtoD3B : Ref :=
  { source := "42 USC § 12112(d)(4)(C)", target := "42 USC § 12112(d)(3)(B)",
    kind := .SubjectTo, internal := true }



def edgeSubjectToD4CtoD3C : Ref :=
  { source := "42 USC § 12112(d)(4)(C)", target := "42 USC § 12112(d)(3)(C)",
    kind := .SubjectTo, internal := true }


def edges12112 : List Ref :=
  [ edgeIncorporates12102
  , edgeIncorporates12111
  , edgeIncorporates12111Accommodation
  , edgeSubchapterScopeB2
  , edgeSubchapterScopeD3C
  , edgeChapterScopeD3Biii
  , edgeInternalBtoA
  , edgeInternalD1toA
  , edgeInternalC2CtoC2
  , edgeExceptAtoC1
  , edgeExceptAtoC2B
  , edgeExceptD2AtoD3
  , edgeExceptD2AtoD2B
  , edgeExceptD4AtoD4B
  , edgeSubjectToD4CtoD3B
  , edgeSubjectToD4CtoD3C ]

end Proving.USC.T42.ADA.Reslice.Structure
