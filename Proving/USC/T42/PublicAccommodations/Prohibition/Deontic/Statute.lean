import Proving.USC.T42.PublicAccommodations.Prohibition.Deontic.Predicates
import Proving.USC.Common.Types









namespace Proving.USC.T42.PublicAccommodations.Prohibition.Deontic

open Proving.USC.Common





structure Prohibition2000a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : StateActorAddressee2000a1 p c
  condition : RequiredByStateLaw2000a1 c



def ProhibitionViolated2000a1 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000a1 p c ∧ DiscriminationOrSegregationAct2000a1 p c





structure Prohibition2000a2 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee2000a2 p c
  condition : RightSecuredBy2000aOr2000a1 r c



def InterferenceAct2000a2 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop :=
  WithholdOrDenyAct2000a2 p r c
    ∨ IntimidateOrCoerceAct2000a2 p r c
    ∨ PunishForExerciseAct2000a2 p r c



def ProhibitionViolated2000a2 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop :=
  Prohibition2000a2 p r c ∧ InterferenceAct2000a2 p r c

end Proving.USC.T42.PublicAccommodations.Prohibition.Deontic
