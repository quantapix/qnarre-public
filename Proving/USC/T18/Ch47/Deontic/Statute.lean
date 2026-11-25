

















import Proving.USC.Common.Types
import Proving.USC.T18.Ch47.Deontic.Types
import Proving.USC.T18.Ch47.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Deontic

open Proving.USC.Common






inductive Circumstance1028c (p : Person) (c : ComplaintText) : Prop where


  | unitedStatesDocument (d : IdentificationArtifact)
      (h : CircumstanceUnitedStatesDocument1028c1 d c)

  | subsectionA4Offense (h : CircumstanceIsSubsectionA4Offense1028c2 p c)


  | interstateCommerceOrMail (d : IdentificationArtifact)
      (h : CircumstanceInterstateCommerceOrMail1028c3 p d c)



inductive ProhibitedAct1028a (p : Person) (c : ComplaintText) : Prop where

  | producesWithoutAuthority (d : IdentificationArtifact)
      (h : ProducesWithoutLawfulAuthority1028a1 p d c)

  | transfersKnowingStolen (d : IdentificationArtifact)
      (h : TransfersKnowingStolenOrUnauthorized1028a2 p d c)

  | possessesFiveOrMore (h : PossessesFiveOrMoreWithUnlawfulIntent1028a3 p c)

  | possessesToDefraudUnitedStates (d : IdentificationArtifact)
      (h : PossessesWithIntentToDefraudUnitedStates1028a4 p d c)

  | implementWithProductionIntent (d : IdentificationArtifact)
      (h : ProducesTransfersOrPossessesImplement1028a5 p d c)

  | possessesStolenUnitedStatesDocument (d : IdentificationArtifact)
      (h : PossessesStolenUnitedStatesDocument1028a6 p d c)

  | usesMeansOfIdentification (d : IdentificationArtifact)
      (h : UsesMeansOfIdentificationForUnlawfulActivity1028a7 p d c)

  | trafficsInAuthenticationFeatures (d : IdentificationArtifact)
      (h : TrafficsInAuthenticationFeatures1028a8 p d c)




structure Prohibition1028a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1028a p c
  condition : Circumstance1028c p c



def ProhibitionViolated1028a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028a p c ∧ ProhibitedAct1028a p c
    ∧ ¬ LawfullyAuthorizedActivityExempt1028e p c





inductive InchoateAct1028f (p : Person) (c : ComplaintText) : Prop where

  | attempt (h : AttemptsOffense1028f p c)

  | conspiracy (h : ConspiresToCommitOffense1028f p c)





structure Prohibition1028f (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1028a p c



def ProhibitionViolated1028f (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028f p c ∧ InchoateAct1028f p c
    ∧ ¬ LawfullyAuthorizedActivityExempt1028e p c







structure Obligation1028g (p : Person) (c : ComplaintText) : Prop where
  condition : ForfeitureProceedingUnderSection1028 p c


def ObligationDischarged1028g (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028g p c ∧ ForfeitureGovernedByReferencedActProvision1028g p c



def ObligationBreached1028g (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028g p c ∧ ¬ ForfeitureGovernedByReferencedActProvision1028g p c






structure Obligation1028h (p : Person) (c : ComplaintText) : Prop where
  condition : ConvictedOfSubsectionAViolation1028h p c


def ObligationDischarged1028h (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028h p c ∧ CourtOrderedForfeitureAndDisposition1028h ct p c



def ObligationBreached1028h (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028h p c ∧ ¬ CourtOrderedForfeitureAndDisposition1028h ct p c







structure Power1028b (p : Person) (t : Tier1028b) (c : ComplaintText) : Prop where
  condition : ProhibitionViolated1028a p c
  tier : TierApplicable1028b p t c


def PowerExercised1028b
    (ct : Court) (p : Person) (t : Tier1028b) (c : ComplaintText) : Prop :=
  Power1028b p t c ∧ PunishmentImposedWithinTier1028b ct p t c





inductive ProhibitedAct1029a (p : Person) (c : ComplaintText) : Prop where

  | counterfeitDevice (d : AccessArtifact)
      (h : ProducesUsesOrTrafficsCounterfeitDevice1029a1 p d c)

  | unauthorizedDevices (d : AccessArtifact)
      (h : TrafficsOrUsesUnauthorizedDevices1029a2 p d c)

  | fifteenOrMoreDevices (h : PossessesFifteenOrMoreDevices1029a3 p c)

  | deviceMakingEquipment (d : AccessArtifact)
      (h : ProducesOrPossessesDeviceMakingEquipment1029a4 p d c)

  | transactionsWithAnothersDevices (d : AccessArtifact)
      (h : EffectsTransactionsWithAnothersDevices1029a5 p d c)

  | unauthorizedSolicitation (d : AccessArtifact)
      (h : SolicitsWithoutIssuerAuthorization1029a6 p d c)

  | modifiedTelecomInstrument (d : AccessArtifact)
      (h : UsesModifiedTelecommunicationsInstrument1029a7 p d c)

  | scanningReceiver (d : AccessArtifact) (h : UsesScanningReceiver1029a8 p d c)

  | configuredHardwareOrSoftware (d : AccessArtifact)
      (h : UsesConfiguredHardwareOrSoftware1029a9 p d c)

  | arrangedPresentation (d : AccessArtifact)
      (h : ArrangesPresentationOfTransactionRecords1029a10 p d c)



structure Prohibition1029a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1029a p c
  condition : AffectsInterstateOrForeignCommerce1029a p c








def Permission1029g1 (p : Person) (c : ComplaintText) : Prop :=
  CarrierAffiliatedActor1029g1 p c ∧ ProtectiveConductForCarrier1029g1 p c
    ∧ ¬ PurposeUnauthorizedServiceFromOtherCarrier1029g1 p c




def Defense1029g2 (p : Person) (c : ComplaintText) : Prop :=
  ResearchOrDevelopmentPurpose1029g2 p c ∧ EstablishedByPreponderance1029g2 p c
    ∧ ¬ ConductIsProducingOrTrafficking1029g2 p c





def ProhibitionViolated1029a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029a p c ∧ ProhibitedAct1029a p c
    ∧ ¬ LawfullyAuthorizedActivityExempt1029f p c




def ProhibitionViolated1029a9
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop :=
  Prohibition1029a p c ∧ UsesConfiguredHardwareOrSoftware1029a9 p d c
    ∧ ¬ LawfullyAuthorizedActivityExempt1029f p c
    ∧ ¬ Permission1029g1 p c
    ∧ ¬ Defense1029g2 p c





inductive InchoateAct1029b (p : Person) (c : ComplaintText) : Prop where

  | attempt (h : AttemptsOffense1029b1 p c)

  | conspiracy (hParty : PartyToConspiracy1029b2 p c)
      (hFurtherance : ConductInFurtheranceByAnyParty1029b2 p c)


def ProhibitionViolated1029b (p : Person) (c : ComplaintText) : Prop :=
  InchoateAct1029b p c ∧ ¬ LawfullyAuthorizedActivityExempt1029f p c






structure Prohibition1029h (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1029a p c
  extraterritorial : ActsOutsideUnitedStatesJurisdiction1029h p c
  condition : InvolvesUnitedStatesConnectedAccessDevice1029h p c


def ProhibitionViolated1029h (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029h p c ∧ ConductWouldConstituteOffenseIfDomestic1029h p c
    ∧ ¬ LawfullyAuthorizedActivityExempt1029f p c





structure Power1029c (p : Person) (t : Tier1029c) (c : ComplaintText) : Prop where
  condition : ProhibitionViolated1029a p c
  tier : TierApplicable1029c p t c


def PowerExercised1029c
    (ct : Court) (p : Person) (t : Tier1029c) (c : ComplaintText) : Prop :=
  Power1029c p t c ∧ PunishmentImposedWithinTier1029c ct p t c




structure Obligation1029c2 (p : Person) (c : ComplaintText) : Prop where
  condition : ForfeitureProceedingUnderSection1029 p c


def ObligationDischarged1029c2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation1029c2 p c ∧ ForfeitureGovernedByReferencedActProvision1029c2 p c


def ObligationBreached1029c2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation1029c2 p c ∧ ¬ ForfeitureGovernedByReferencedActProvision1029c2 p c







structure Power1029d (ag : Agency) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesSecretService ag c


def PowerExercised1029d (ag : Agency) (p : Person) (c : ComplaintText) : Prop :=
  Power1029d ag c ∧ InvestigatesOffenseUnderSection1029 ag p c




structure Obligation1029dExercise (ag : Agency) (c : ComplaintText) : Prop where
  condition : Power1029d ag c


def ObligationDischarged1029dExercise (ag : Agency) (c : ComplaintText) : Prop :=
  Obligation1029dExercise ag c ∧ AuthorityExercisedInAccordanceWithAgreement1029d ag c


def ObligationBreached1029dExercise (ag : Agency) (c : ComplaintText) : Prop :=
  Obligation1029dExercise ag c ∧ ¬ AuthorityExercisedInAccordanceWithAgreement1029d ag c





def ObligationDischarged1029dAgreement (c : ComplaintText) : Prop :=
  AgreementEnteredByTreasuryAndAttorneyGeneral1029d c


def ObligationBreached1029dAgreement (c : ComplaintText) : Prop :=
  ¬ AgreementEnteredByTreasuryAndAttorneyGeneral1029d c









def modality1028a : Modality := Modality.prohibition

def modality1028b : Modality := Modality.power

def modality1028d : Modality := Modality.definition

def modality1028e : Modality := Modality.permission

def modality1028f : Modality := Modality.prohibition

def modality1028g : Modality := Modality.obligation

def modality1028h : Modality := Modality.obligation

def modality1028i : Modality := Modality.definition

def modality1029a : Modality := Modality.prohibition

def modality1029b : Modality := Modality.prohibition

def modality1029c : Modality := Modality.power

def modality1029d : Modality := Modality.power

def modality1029e : Modality := Modality.definition

def modality1029f : Modality := Modality.permission


def modality1029g : Modality := Modality.permission

def modality1029h : Modality := Modality.prohibition

end Proving.USC.T18.Ch47.Deontic
