















import Proving.USC.T18.Ch11.EchoReslice.Scienter.Types
import Proving.USC.T18.Ch11.EchoReslice.Scienter.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Scienter

open Proving.USC.Common






def ReachesRung (p : Person) (required : MentalState) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalState.atLeast rung required ∧ MentalStateProven p rung c


def ReachesParagraphRung (p : Person) (para : Paragraph201) (c : ComplaintText) : Prop :=
  ReachesRung p (RequiredMentalState para) c




structure PurposeToInfluenceOfficialAct (giver : Person) (c : ComplaintText) : Prop where

  reachesRung : ReachesParagraphRung giver .b1A c

  objective : IntendsToInfluenceOfficialAct giver c



structure PurposeToDefraudUnitedStates (giver : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung giver .b1B c
  objective : IntendsToInduceFraudOnUnitedStates giver c



structure PurposeToInduceBreachOfLawfulDuty (giver : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung giver .b1C c
  objective : IntendsToInduceBreachOfLawfulDuty giver c


inductive BriberyGiverPurpose201b1 (giver : Person) (c : ComplaintText) : Prop
  | influenceOfficialAct (h : PurposeToInfluenceOfficialAct giver c)
  | fraudOnUnitedStates (h : PurposeToDefraudUnitedStates giver c)
  | breachOfLawfulDuty (h : PurposeToInduceBreachOfLawfulDuty giver c)





structure BargainForInfluenceInOfficialAct (official : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung official .b2A c

  bargain : HoldsQuidProQuoUnderstanding official c
  objective : AcceptsInReturnForInfluenceInOfficialAct official c



structure BargainForFraudOnUnitedStates (official : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung official .b2B c
  bargain : HoldsQuidProQuoUnderstanding official c
  objective : AcceptsInReturnForFraudOnUnitedStates official c



structure BargainForBreachOfOfficialDuty (official : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung official .b2C c
  bargain : HoldsQuidProQuoUnderstanding official c
  objective : AcceptsInReturnForBreachOfOfficialDuty official c


inductive OfficialBargain201b2 (official : Person) (c : ComplaintText) : Prop
  | influenceInOfficialAct (h : BargainForInfluenceInOfficialAct official c)
  | fraudOnUnitedStates (h : BargainForFraudOnUnitedStates official c)
  | breachOfOfficialDuty (h : BargainForBreachOfOfficialDuty official c)




structure PurposeToInfluenceTestimony (giver : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung giver .b3Influence c
  objective : IntendsToInfluenceTestimony giver c


structure PurposeToInduceAbsence (giver : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung giver .b3Absence c
  objective : IntendsToInduceAbsenceFromProceeding giver c


inductive WitnessBriberyGiverPurpose201b3 (giver : Person) (c : ComplaintText) : Prop
  | influenceTestimony (h : PurposeToInfluenceTestimony giver c)
  | induceAbsence (h : PurposeToInduceAbsence giver c)




structure BargainForInfluenceInTestimony (witness : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung witness .b4Influence c
  bargain : HoldsQuidProQuoUnderstanding witness c
  objective : AcceptsInReturnForInfluenceInTestimony witness c


structure BargainForAbsence (witness : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung witness .b4Absence c
  bargain : HoldsQuidProQuoUnderstanding witness c
  objective : AcceptsInReturnForAbsenceFromProceeding witness c


inductive WitnessBargain201b4 (witness : Person) (c : ComplaintText) : Prop
  | influenceInTestimony (h : BargainForInfluenceInTestimony witness c)
  | absence (h : BargainForAbsence witness c)






structure Scienter201b1 (giver : Person) (c : ComplaintText) : Prop where

  corrupt : ActsCorruptly giver c

  purpose : BriberyGiverPurpose201b1 giver c



structure Scienter201b2 (official : Person) (c : ComplaintText) : Prop where
  corrupt : ActsCorruptly official c
  bargainObject : OfficialBargain201b2 official c





structure Scienter201b3 (giver : Person) (c : ComplaintText) : Prop where
  corrupt : ActsCorruptly giver c
  purpose : WitnessBriberyGiverPurpose201b3 giver c

  notExemptPayment : ¬ PaymentIsExemptWitnessFeeOrExpense giver c


structure Scienter201b4 (witness : Person) (c : ComplaintText) : Prop where
  corrupt : ActsCorruptly witness c
  bargainObject : WitnessBargain201b4 witness c

  notExemptPayment : ¬ PaymentIsExemptWitnessFeeOrExpense witness c









structure Scienter201c1A (giver : Person) (c : ComplaintText) : Prop where

  reachesRung : ReachesParagraphRung giver .c1A c

  linkage : KnowsValueIsForOrBecauseOfOfficialAct giver c


  notLawfulDischarge : NotAuthorizedByLawForProperDischargeOfDuty giver c



structure Scienter201c1B (official : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung official .c1B c
  linkage : KnowsValueIsForOrBecauseOfOfficialAct official c
  notLawfulDischarge : NotAuthorizedByLawForProperDischargeOfDuty official c




structure Scienter201c2 (giver : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung giver .c2 c
  linkage : KnowsValueIsForOrBecauseOfTestimony giver c

  notExemptPayment : ¬ PaymentIsExemptWitnessFeeOrExpense giver c



structure Scienter201c3 (witness : Person) (c : ComplaintText) : Prop where
  reachesRung : ReachesParagraphRung witness .c3 c
  linkage : KnowsValueIsForOrBecauseOfTestimony witness c

  notExemptPayment : ¬ PaymentIsExemptWitnessFeeOrExpense witness c




inductive BriberyTierScienter201 (p : Person) (c : ComplaintText) : Prop
  | giver (h : Scienter201b1 p c)
  | official (h : Scienter201b2 p c)
  | witnessGiver (h : Scienter201b3 p c)
  | witnessReceiver (h : Scienter201b4 p c)


inductive GratuityTierScienter201 (p : Person) (c : ComplaintText) : Prop
  | giver (h : Scienter201c1A p c)
  | official (h : Scienter201c1B p c)
  | witnessGiver (h : Scienter201c2 p c)
  | witnessReceiver (h : Scienter201c3 p c)



inductive Section201Culpable (p : Person) (c : ComplaintText) : Prop
  | bribery (h : BriberyTierScienter201 p c)
  | gratuity (h : GratuityTierScienter201 p c)






def GratuityWithoutBargain201 (p : Person) (c : ComplaintText) : Prop :=
  GratuityTierScienter201 p c ∧ ¬ HoldsQuidProQuoUnderstanding p c



def tierOf (para : Paragraph201) : OffenseTier201 := para.tier

end Proving.USC.T18.Ch11.EchoReslice.Scienter
