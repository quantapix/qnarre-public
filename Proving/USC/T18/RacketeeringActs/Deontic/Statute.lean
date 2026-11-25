












import Proving.USC.T18.RacketeeringActs.Deontic.Doctrine
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.RacketeeringActs.Deontic

open Proving.USC.Common






def RacketeeringActivityDefinition (o : Offense) (c : ComplaintText) : Prop :=
  IsEnumeratedRacketeeringOffense o c


def section1961_modality : Modality := Modality.Definition





structure Prohibition1951 (p : Person) (c : ComplaintText) : Prop where
  addressee : WhoeverAddressee p c


  condition : ObstructedOrAffectedCommerce p c



def Prohibition1951Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1951 p c ∧ HobbsActDone p c

def section1951_modality : Modality := Modality.Prohibition





structure Prohibition1952 (p : Person) (c : ComplaintText) : Prop where
  addressee : WhoeverAddressee p c
  condition : IsUnlawfulActivity p c



def Prohibition1952Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1952 p c
    ∧ TraveledOrUsedInterstateFacility p c
    ∧ IntentToAidUnlawfulActivity p c

def section1952_modality : Modality := Modality.Prohibition





structure Prohibition1956 (p : Person) (t : Transaction) (c : ComplaintText) : Prop where
  addressee : WhoeverAddressee p c
  condition : InvolvedSpecifiedUnlawfulActivity t c





def Prohibition1956Violated (p : Person) (t : Transaction) (c : ComplaintText) : Prop :=
  Prohibition1956 p t c ∧ LaunderingActDone p t c

def section1956_modality : Modality := Modality.Prohibition






def Exceeds10kThreshold (t : Transaction) (c : ComplaintText) : Prop :=
  10000 < TransactedPropertyValue t c



structure Prohibition1957 (p : Person) (c : ComplaintText) : Prop where
  addressee : WhoeverAddressee p c
  condition : Section1957CircumstanceMet p c




def Prohibition1957Violated (p : Person) (t : Transaction) (c : ComplaintText) : Prop :=
  Prohibition1957 p c
    ∧ EngagedInMonetaryTransaction p t c
    ∧ IsCriminallyDerivedProperty t c
    ∧ Exceeds10kThreshold t c

def section1957_modality : Modality := Modality.Prohibition

end Proving.USC.T18.RacketeeringActs.Deontic
