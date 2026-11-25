


















import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Types
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Evidentiary

open Proving.USC.Common (ComplaintText)




def alloc2000e5b : Allocation :=
  { bearer := .Government, standard := .ReasonableCause, presumption := .None }


def alloc2000e5g1 : Allocation :=
  { bearer := .Plaintiff, standard := .Preponderance, presumption := .None }


def alloc2000e6a : Allocation :=
  { bearer := .Government, standard := .ReasonableCause, presumption := .None }


def alloc2000e8c : Allocation :=
  { bearer := .Defendant, standard := .Preponderance, presumption := .None }



def alloc2000e12b : Allocation :=
  { bearer := .Defendant, standard := .Preponderance, presumption := .Conclusive }


def alloc2000e16d : Allocation :=
  { bearer := .Plaintiff, standard := .Preponderance, presumption := .None }




structure Proof2000e5b (c : ComplaintText) : Prop where
  cause : ReasonableCauseFound alloc2000e5b.bearer c


structure Proof2000e5g1 (c : ComplaintText) : Prop where
  carried : BurdenCarried alloc2000e5g1.bearer alloc2000e5g1.standard c




structure Proof2000e5g2B (c : ComplaintText) : Prop where
  motivatingFactor : MotivatingFactorProven c


structure Proof2000e6a (c : ComplaintText) : Prop where
  cause : ReasonableCauseFound alloc2000e6a.bearer c


structure Proof2000e8c (c : ComplaintText) : Prop where
  hardship : UndueHardshipShown alloc2000e8c.bearer c


structure Proof2000e12b (c : ComplaintText) : Prop where
  reliance : GoodFaithRelianceProven c


structure Proof2000e16d (c : ComplaintText) : Prop where
  carried : FederalSectorBurdenCarried alloc2000e16d.bearer alloc2000e16d.standard c





def Section2000e5g1Established (c : ComplaintText) : Prop :=
  Proof2000e5g1 c




def Section2000e5g2BFullRelief (c : ComplaintText) : Prop :=
  Proof2000e5g2B c ∧ ¬ SameDecisionShown c




def Section2000e5g2BLimitedRelief (c : ComplaintText) : Prop :=
  Proof2000e5g2B c ∧ SameDecisionShown c



def Section2000e12bBars (c : ComplaintText) : Prop :=
  Proof2000e12b c





def PrivateMeritsEstablished (c : ComplaintText) : Prop :=
  Section2000e5g1Established c ∧ ¬ Section2000e12bBars c




def FederalSectorMeritsEstablished (c : ComplaintText) : Prop :=
  Proof2000e16d c ∧ ¬ Section2000e12bBars c

end Proving.USC.T42.TitleVIIEnf.Evidentiary
