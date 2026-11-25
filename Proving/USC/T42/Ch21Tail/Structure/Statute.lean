import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Tail.Structure.Types
import Proving.USC.T42.Ch21Tail.Structure.Predicates

set_option autoImplicit false













namespace Proving.USC.T42.Ch21Tail.Structure

open Proving.USC.Common







def edge1997dIncorporatesSubchapter : Ref :=
  { source := "42 USC § 1997d"
    target := "42 USC §§ 1997–1997j (this subchapter)"
    kind   := .Incorporates
    clause := "conditions which may constitute a violation under this subchapter" }





def edge1997gIncorporatesSubchapterCoverage : Ref :=
  { source := "42 USC § 1997g"
    target := "42 USC §§ 1997–1997j (this subchapter)"
    kind   := .Incorporates
    clause := "deplorable conditions in institutions covered by this subchapter" }




def edge1997gIncorporatesConstitutionalRights : Ref :=
  { source := "42 USC § 1997g"
    target := "U.S. Const.; laws of the United States (external)"
    kind   := .Incorporates
    clause := "deprivations of rights protected by the Constitution or laws of the United States" }




def edge1997gIncorporatesSubchapterLitigation : Ref :=
  { source := "42 USC § 1997g"
    target := "42 USC §§ 1997–1997j (this subchapter)"
    kind   := .Incorporates
    clause := "not only by litigation as contemplated in this subchapter" }



def edge1997gSavingsNoFundRedirection : Ref :=
  { source := "42 USC § 1997g"
    target := "Federal program appropriation and grant statutes (other law, external)"
    kind   := .Savings
    clause := "It is not the intent of this provision to require the redirection of funds from one program to another or from one State to another" }



def scoped1997dSubchapter : ScopedRef :=
  { ref := edge1997dIncorporatesSubchapter, scope := .SameSubchapter }

def scoped1997gCoverage : ScopedRef :=
  { ref := edge1997gIncorporatesSubchapterCoverage, scope := .SameSubchapter }

def scoped1997gConstitutionalRights : ScopedRef :=
  { ref := edge1997gIncorporatesConstitutionalRights, scope := .ExternalLaw }

def scoped1997gLitigation : ScopedRef :=
  { ref := edge1997gIncorporatesSubchapterLitigation, scope := .SameSubchapter }

def scoped1997gSavings : ScopedRef :=
  { ref := edge1997gSavingsNoFundRedirection, scope := .ExternalLaw }


def edges : List ScopedRef :=
  [ scoped1997dSubchapter
  , scoped1997gCoverage
  , scoped1997gConstitutionalRights
  , scoped1997gLitigation
  , scoped1997gSavings ]











inductive SubchapterViolationReferenceResolved (c : ComplaintText) : Prop where
  | viaConditionWithinScope :
      ReportedConditionWithinSubchapterScope c →
      SubchapterViolationReferenceResolved c
  | viaPotentialApplication :
      IncorporationHonored edge1997dIncorporatesSubchapter c →
      SubchapterViolationReferenceResolved c







structure Coherent1997d (c : ComplaintText) : Prop where
  subchapterExists : ReferencedSectionExists edge1997dIncorporatesSubchapter c
  violationReferenceResolved : SubchapterViolationReferenceResolved c







structure Coherent1997g (inst : Entity) (c : ComplaintText) : Prop where
  coverageSourceExists : ReferencedSectionExists edge1997gIncorporatesSubchapterCoverage c
  institutionCovered : InstitutionCoveredBySubchapter inst c
  rightsReferenceResolves : ConstitutionalOrFederalRightsReferenceResolves c
  litigationRegimeExists : ReferencedSectionExists edge1997gIncorporatesSubchapterLitigation c
  litigationIncorporationHonored : IncorporationHonored edge1997gIncorporatesSubchapterLitigation c
  noRedirectionPreserved : SavingsClausePreserved edge1997gSavingsNoFundRedirection c


structure Ch21TailReferencesResolve (inst : Entity) (c : ComplaintText) : Prop where
  s1997d : Coherent1997d c
  s1997g : Coherent1997g inst c

end Proving.USC.T42.Ch21Tail.Structure
