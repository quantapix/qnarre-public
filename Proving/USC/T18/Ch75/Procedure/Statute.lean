











import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Procedure.Types
import Proving.USC.T18.Ch75.Procedure.Predicates

namespace Proving.USC.T18.Ch75.Procedure

open Proving.USC.Common


structure Transition where
  fromState : ProsecutionState
  toState   : ProsecutionState



structure TerrorismTier (p : Person) (c : ComplaintText) : Prop where
  offenseProven    : OffenseProven p c
  terrorismPurpose : CommittedToFacilitateTerrorism p c




structure DrugTraffickingTier (p : Person) (c : ComplaintText) : Prop where
  offenseProven : OffenseProven p c
  drugPurpose   : CommittedToFacilitateDrugTrafficking p c
  notTerrorism  : ¬ CommittedToFacilitateTerrorism p c




structure FirstOrSecondTier (p : Person) (c : ComplaintText) : Prop where
  offenseProven : OffenseProven p c
  notTerrorism  : ¬ CommittedToFacilitateTerrorism p c
  notDrug       : ¬ CommittedToFacilitateDrugTrafficking p c
  firstOrSecond : IsFirstOrSecondOffense p c




structure OtherTier (p : Person) (c : ComplaintText) : Prop where
  offenseProven    : OffenseProven p c
  notTerrorism     : ¬ CommittedToFacilitateTerrorism p c
  notDrug          : ¬ CommittedToFacilitateDrugTrafficking p c
  notFirstOrSecond : ¬ IsFirstOrSecondOffense p c










inductive ApplicableSentencingTier (p : Person) (c : ComplaintText) : Prop
  | terrorism     (h : TerrorismTier p c)
  | drug          (h : DrugTraffickingTier p c)
  | firstOrSecond (h : FirstOrSecondTier p c)
  | other         (h : OtherTier p c)

end Proving.USC.T18.Ch75.Procedure
