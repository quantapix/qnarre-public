
















import Proving.USC.T42.TitleVIIDef.Deontic.Types
import Proving.USC.T42.TitleVIIDef.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Deontic

open Proving.USC.Common








structure DefinitionBlock (p : Person) (c : ComplaintText) : Prop where

  coveredEmployer : IsCoveredEmployer p c

  respondent      : IsRespondent p c





structure Prohibition2000e2a (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  addressee : AddresseeEmployer p c
  condition : BecauseOfProtectedGround p g c



def Prohibition2000e2aViolated (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop :=
  Prohibition2000e2a p g c ∧ DiscriminatoryActOccurred p c ∧ ¬ ExceptionApplies p c


structure Prohibition2000e2b (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  addressee : AddresseeEmploymentAgency p c
  condition : BecauseOfProtectedGround p g c

def Prohibition2000e2bViolated (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop :=
  Prohibition2000e2b p g c ∧ DiscriminatoryActOccurred p c ∧ ¬ ExceptionApplies p c


structure Prohibition2000e2c (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  addressee : AddresseeLaborOrganization p c
  condition : BecauseOfProtectedGround p g c

def Prohibition2000e2cViolated (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop :=
  Prohibition2000e2c p g c ∧ DiscriminatoryActOccurred p c ∧ ¬ ExceptionApplies p c


structure Prohibition2000e2d (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  addressee : AddresseeTrainingController p c
  condition : BecauseOfProtectedGround p g c

def Prohibition2000e2dViolated (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop :=
  Prohibition2000e2d p g c ∧ DiscriminatoryActOccurred p c ∧ ¬ ExceptionApplies p c





structure Prohibition2000e2k (p : Person) (c : ComplaintText) : Prop where
  addressee : IsRespondent p c




def Prohibition2000e2kViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e2k p c ∧ CausesUnjustifiedDisparateImpact p c


structure Prohibition2000e2l (p : Person) (c : ComplaintText) : Prop where
  addressee : IsRespondent p c

def Prohibition2000e2lViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e2l p c ∧ AlteredTestScoresOnProtectedGround p c



structure Prohibition2000e2m (p : Person) (c : ComplaintText) : Prop where
  addressee : IsRespondent p c

def Prohibition2000e2mViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e2m p c ∧ ProtectedGroundWasMotivatingFactor p c





structure Prohibition2000e3a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeRetaliation p c
  condition : ProtectedActivityOccurred p c

def Prohibition2000e3aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e3a p c ∧ RetaliatoryActOccurred p c


structure Prohibition2000e3b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeRetaliation p c

def Prohibition2000e3bViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e3b p c ∧ PublishedDiscriminatoryAdvertisement p c





inductive TitleVIINormViolated (p : Person) (c : ComplaintText) : Prop
  | viaEmployer        (g : ProtectedGround) (h : Prohibition2000e2aViolated p g c)
  | viaEmploymentAgency (g : ProtectedGround) (h : Prohibition2000e2bViolated p g c)
  | viaLaborOrg        (g : ProtectedGround) (h : Prohibition2000e2cViolated p g c)
  | viaTraining        (g : ProtectedGround) (h : Prohibition2000e2dViolated p g c)
  | viaDisparateImpact (h : Prohibition2000e2kViolated p c)
  | viaScoreAdjustment (h : Prohibition2000e2lViolated p c)
  | viaMotivatingFactor (h : Prohibition2000e2mViolated p c)
  | viaRetaliation     (h : Prohibition2000e3aViolated p c)
  | viaAdvertisement   (h : Prohibition2000e3bViolated p c)

end Proving.USC.T42.TitleVIIDef.Deontic
