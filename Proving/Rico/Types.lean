

















namespace Proving.Rico




opaque ComplaintText : Type


opaque Person : Type





opaque Entity : Type



opaque Act : Type




opaque Time : Type

axiom Time.le : Time → Time → Prop
axiom Act.committedAt : Act → Time






opaque Investment : Type




opaque InterestOrControl : Type






opaque Agreement : Type






opaque UnlawfulDebt : Type

end Proving.Rico
