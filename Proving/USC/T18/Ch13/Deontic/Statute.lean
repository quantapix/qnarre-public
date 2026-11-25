











import Proving.USC.T18.Ch13.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch13.Deontic

open Proving.USC.Common


structure Prohibition241 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass241 p c
  condition : ConditionMet241 c


def ProhibitionViolated241 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition241 p c ∧ RegulatedActOccurred241 p c


structure Prohibition242 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass242 p c
  condition : ConditionMet242 c


def ProhibitionViolated242 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition242 p c ∧ RegulatedActOccurred242 p c


structure Prohibition243 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass243 p c
  condition : ConditionMet243 c


def ProhibitionViolated243 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition243 p c ∧ RegulatedActOccurred243 p c


structure Prohibition244 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass244 p c
  condition : ConditionMet244 c


def ProhibitionViolated244 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition244 p c ∧ RegulatedActOccurred244 p c


structure Prohibition245 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass245 p c
  condition : ConditionMet245 c


def ProhibitionViolated245 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition245 p c ∧ RegulatedActOccurred245 p c


structure CertificationObligation (c : ComplaintText) : Prop where
  condition : ProsecutionUnderChapterUndertaken c


def CertificationBreached (c : ComplaintText) : Prop :=
  ProsecutionUnderChapterUndertaken c ∧ ¬ AttorneyGeneralCertificationMade c


structure Prohibition246 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass246 p c
  condition : ConditionMet246 c


def ProhibitionViolated246 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition246 p c ∧ RegulatedActOccurred246 p c


structure Prohibition247 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass247 p c
  condition : ConditionMet247 c


def ProhibitionViolated247 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition247 p c ∧ RegulatedActOccurred247 p c


structure Prohibition248 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass248 p c
  condition : ConditionMet248 c


def ProhibitionViolated248 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition248 p c ∧ RegulatedActOccurred248 p c


structure Prohibition249 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass249 p c
  condition : ConditionMet249 c


def ProhibitionViolated249 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition249 p c ∧ RegulatedActOccurred249 p c


structure Prohibition250 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass250 p c
  condition : ConditionMet250 c


def ProhibitionViolated250 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition250 p c ∧ RegulatedActOccurred250 p c

end Proving.USC.T18.Ch13.Deontic
