












import Proving.USC.T18.Ch2.Deontic.Predicates

namespace Proving.USC.T18.Ch2.Deontic

open Proving.USC.Common




def Norm.modality : Norm → Modality
  | .s32 | .s32c | .s33 | .s35 | .s36 | .s37 | .s38
  | .s39a1 | .s39a2 | .s39A | .s39B | .s40leave | .s40A => .Prohibition
  | .s40stop => .Obligation



structure Prohibition (p : Person) (n : Norm) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass p n c
  condition : ConditionMet n c



def ProhibitionViolated (p : Person) (n : Norm) (c : ComplaintText) : Prop :=
  Prohibition p n c ∧ RegulatedActOccurred p n c



structure Obligation (p : Person) (n : Norm) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass p n c
  condition : ConditionMet n c



def ObligationBreached (p : Person) (n : Norm) (c : ComplaintText) : Prop :=
  Obligation p n c ∧ ¬ RegulatedActOccurred p n c




def Prohibition32Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s32 c

def Prohibition32cViolated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s32c c

def Prohibition33Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s33 c

def Prohibition35Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s35 c

def Prohibition36Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s36 c

def Prohibition37Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s37 c

def Prohibition38Violated  (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s38 c

def Prohibition39a1Violated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s39a1 c

def Prohibition39a2Violated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s39a2 c

def Prohibition39AViolated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s39A c

def Prohibition39BViolated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s39B c

def Prohibition40leaveViolated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s40leave c

def Prohibition40AViolated (p : Person) (c : ComplaintText) : Prop := ProhibitionViolated p .s40A c

def Obligation40stopBreached (p : Person) (c : ComplaintText) : Prop := ObligationBreached p .s40stop c

end Proving.USC.T18.Ch2.Deontic
