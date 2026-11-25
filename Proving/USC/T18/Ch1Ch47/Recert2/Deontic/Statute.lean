import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false
























namespace Proving.USC.T18.Ch1Ch47.Recert2.Deontic

open Proving.USC.Common





structure Definition7 (l : Locus) (c : ComplaintText) : Prop where

  locus : LocusWithinSMTJ l c




structure Locus7Para9 (l : Locus) (p : Person) (c : ComplaintText) : Prop where

  branch : Section7Paragraph9Locus l c

  notCarvedOut : ¬ OffenderDescribedInSection3261a p c




structure Prohibition7Para9Construction
    (ct : Court) (t : Treaty) (c : ComplaintText) : Prop where

  addressee : AddresseeInterpretingCourt ct c

  condition : Paragraph9ConflictsWithTreaty t c




def Prohibition7Para9ConstructionViolated
    (ct : Court) (t : Treaty) (c : ComplaintText) : Prop :=
  Prohibition7Para9Construction ct t c ∧ DeemedToSupersedeConflictingTreaty ct t c




structure Definition20 (i : Institution) (c : ComplaintText) : Prop where

  member : IsFinancialInstitution i c





structure Permission21a
    (g : Person) (d : Person) (pr : Property) (c : ComplaintText) : Prop where

  addressee : AddresseeProponentOfProof g c


  elementAtIssue : StolenOrCounterfeitNatureIsElement pr c

  representation : OfficialRepresentationMade d pr c

  belief : DefendantBelievedPropertyOfSuchCharacter d pr c



def Permission21aExercised
    (g : Person) (d : Person) (pr : Property) (c : ComplaintText) : Prop :=
  Permission21a g d pr c ∧ EstablishesElementByBeliefProof g d pr c





structure Definition23 (ct : Court) (c : ComplaintText) : Prop where

  included : IsCourtOfTheUnitedStates ct c

  notDisplaced : ¬ OtherwiseExpresslyProvided c








inductive FederalHealthCareOffense
    (o : OffenseInstance) (c : ComplaintText) : Prop where

  | enumerated :
      ViolationOfEnumeratedHealthCareStatute o c → FederalHealthCareOffense o c

  | conditioned :
      ViolationOfConditionedHealthCareStatute o c →
      RelatesToHealthCareBenefitProgram o c → FederalHealthCareOffense o c


structure Definition24b (e : Entity) (c : ComplaintText) : Prop where

  program : IsHealthCareBenefitProgram e c




inductive ProhibitedAct1028a
    (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop where

  | produce : ProhibitedAct1028a1 p d c → ProhibitedAct1028a p d c

  | transferStolen : ProhibitedAct1028a2 p d c → ProhibitedAct1028a p d c

  | possessFiveOrMore : ProhibitedAct1028a3 p d c → ProhibitedAct1028a p d c

  | possessToDefraudUS : ProhibitedAct1028a4 p d c → ProhibitedAct1028a p d c

  | implement : ProhibitedAct1028a5 p d c → ProhibitedAct1028a p d c

  | possessUSDocument : ProhibitedAct1028a6 p d c → ProhibitedAct1028a p d c

  | meansOfIdentification : ProhibitedAct1028a7 p d c → ProhibitedAct1028a p d c

  | traffickingFeatures : ProhibitedAct1028a8 p d c → ProhibitedAct1028a p d c




inductive Circumstance1028c
    (p : Person) (d : IdentificationObject) (o : OffenseInstance)
    (c : ComplaintText) : Prop where

  | federalAuthority : Circumstance1028c1 d c → Circumstance1028c p d o c

  | offenseUnderA4 : ProhibitedAct1028a4 p d c → Circumstance1028c p d o c

  | commerce : AffectsInterstateOrForeignCommerce o c → Circumstance1028c p d o c

  | mails : TransportedInMailInCourseOfConduct d o c → Circumstance1028c p d o c



structure Prohibition1028a
    (p : Person) (d : IdentificationObject) (o : OffenseInstance)
    (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c

  circumstance : Circumstance1028c p d o c





def Prohibition1028aViolated
    (p : Person) (d : IdentificationObject) (o : OffenseInstance)
    (c : ComplaintText) : Prop :=
  Prohibition1028a p d o c ∧ ProhibitedAct1028a p d c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c



structure Prohibition1028f (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c


def Prohibition1028fViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028f p c ∧ AttemptedOrConspired1028f p c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c



structure ObligationPunish1028
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingCourt ct c

  condition : ConvictedOfViolation1028a p o c



def ObligationPunish1028Breached
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationPunish1028 ct p o c ∧ ¬ PunishedAsProvided1028b ct p o c



structure ObligationForfeit1028h
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeCourtOfConviction ct o c


  condition : ConvictedOfViolation1028a p o c


def ObligationForfeit1028hBreached
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationForfeit1028h ct p o c ∧ ¬ OrderedForfeitureAndDisposition1028h ct o c



structure ObligationForfeitureProcedure1028g
    (ct : Court) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeForfeitingAuthority ct c

  condition : ForfeitureUnderSection1028 o c


def ObligationForfeitureProcedure1028gBreached
    (ct : Court) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationForfeitureProcedure1028g ct o c ∧ ¬ ForfeitureGovernedBySection413 o c



structure Definition1028i (d : IdentificationObject) (c : ComplaintText) : Prop where

  single : SingleDocumentBearingMultipleMeans d c




inductive ProhibitedAct1029a
    (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop where

  | counterfeitDevice : ProhibitedAct1029a1 p dv c → ProhibitedAct1029a p dv c

  | unauthorizedThreshold : ProhibitedAct1029a2 p dv c → ProhibitedAct1029a p dv c

  | fifteenOrMore : ProhibitedAct1029a3 p dv c → ProhibitedAct1029a p dv c

  | deviceMakingEquipment : ProhibitedAct1029a4 p dv c → ProhibitedAct1029a p dv c

  | transactionsAnothers : ProhibitedAct1029a5 p dv c → ProhibitedAct1029a p dv c

  | solicitation : ProhibitedAct1029a6 p dv c → ProhibitedAct1029a p dv c

  | modifiedInstrument : ProhibitedAct1029a7 p dv c → ProhibitedAct1029a p dv c

  | scanningReceiver : ProhibitedAct1029a8 p dv c → ProhibitedAct1029a p dv c

  | configuredHardware : ProhibitedAct1029a9 p dv c → ProhibitedAct1029a p dv c

  | causedPresentment : ProhibitedAct1029a10 p dv c → ProhibitedAct1029a p dv c



structure Prohibition1029a
    (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c

  condition : AffectsInterstateOrForeignCommerce o c



def Prohibition1029aViolated
    (p : Person) (dv : AccessDevice) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  Prohibition1029a p o c ∧ ProhibitedAct1029a p dv c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c




structure Permission1029g1
    (p : Person) (e : Entity) (c : ComplaintText) : Prop where

  addressee : AddresseeCarrierAffiliate p e c

  carrier : IsFacilitiesBasedCarrier e c



def Permission1029g1Available
    (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Permission1029g1 p e c ∧ ProtectiveConductForCarrier p e c ∧
    ¬ TraffickingConduct1029g1 p c ∧ ¬ PurposeObtainAnotherCarriersService p c



def Defense1029g2Established (p : Person) (c : ComplaintText) : Prop :=
  ResearchOrDevelopmentDefenseEstablished p c ∧ ¬ ProducingOrTrafficking1029g2 p c





def Prohibition1029a9Violated
    (p : Person) (dv : AccessDevice) (e : Entity) (o : OffenseInstance)
    (c : ComplaintText) : Prop :=
  Prohibition1029a p o c ∧ ProhibitedAct1029a9 p dv c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c ∧
    ¬ Permission1029g1Available p e c ∧
    ¬ Defense1029g2Established p c


structure Prohibition1029b1 (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c


def Prohibition1029b1Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029b1 p c ∧ Attempted1029b1 p c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c



structure Prohibition1029b2 (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c

  condition : OvertActInFurtherance1029b2 c


def Prohibition1029b2Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029b2 p c ∧ PartyToConspiracy1029b2 p c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c


structure ObligationPunish1029
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingCourt ct c

  condition : ConvictedOfViolation1029 p o c


def ObligationPunish1029Breached
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationPunish1029 ct p o c ∧ ¬ PunishedAsProvided1029c ct p o c



structure ObligationForfeitureProcedure1029c2
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeForfeitingAuthority ct c

  condition : ConvictedOfViolation1029 p o c


def ObligationForfeitureProcedure1029c2Breached
    (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationForfeitureProcedure1029c2 ct p o c ∧ ¬ ForfeitureGovernedBySection413 o c



structure Power1029dInvestigate
    (a : Agency) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeSecretService a c

  competence : HasAuthorityToInvestigate1029d a o c



structure ObligationEnterAgreement1029d (a : Agency) (c : ComplaintText) : Prop where

  addressee : AddresseeTreasuryAndAttorneyGeneral a c


def ObligationEnterAgreement1029dBreached
    (a : Agency) (ag : Agreement) (c : ComplaintText) : Prop :=
  ObligationEnterAgreement1029d a c ∧ ¬ InteragencyAgreementEntered ag c



structure ObligationExerciseUnderAgreement1029d
    (a : Agency) (o : OffenseInstance) (c : ComplaintText) : Prop where

  addressee : AddresseeSecretService a c

  condition : HasAuthorityToInvestigate1029d a o c



def ObligationExerciseUnderAgreement1029dBreached
    (a : Agency) (ag : Agreement) (o : OffenseInstance) (c : ComplaintText) : Prop :=
  ObligationExerciseUnderAgreement1029d a o c ∧
    ¬ AuthorityExercisedInAccordanceWithAgreement a ag c



structure Prohibition1029h
    (p : Person) (dv : AccessDevice) (i : Institution) (c : ComplaintText) : Prop where

  addressee : AddresseeAnyPerson p c

  extraterritorial : ActOutsideUnitedStatesJurisdiction p c


  condition : DeviceLinkedToUnitedStatesEntity dv i c


def Prohibition1029hViolated
    (p : Person) (dv : AccessDevice) (i : Institution) (c : ComplaintText) : Prop :=
  Prohibition1029h p dv i c ∧ WouldConstituteOffenseUnder1029ab p dv c ∧
    ¬ ExemptAuthorizedLawEnforcementActivity p c









def USNexusViaFinancialInstitution
    (dv : AccessDevice) (i : Institution) (c : ComplaintText) : Prop :=
  IsFinancialInstitution i c ∧ DeviceLinkedToUnitedStatesEntity dv i c


def CreditCardSystemMemberNexus1029a10
    (p : Person) (dv : AccessDevice) (e : Entity) (c : ComplaintText) : Prop :=
  IsCreditCardSystemMember e c ∧ ProhibitedAct1029a10 p dv c


def MeansOfIdentificationCount1028a7
    (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop :=
  ProhibitedAct1028a7 p d c ∧ SingleDocumentBearingMultipleMeans d c








def modalitySection7 : Modality := Modality.definition

def modalitySection7Para9Flush : Modality := Modality.prohibition

def modalitySection20 : Modality := Modality.definition

def modalitySection21a : Modality := Modality.permission

def modalitySection21b : Modality := Modality.definition

def modalitySection23 : Modality := Modality.definition

def modalitySection24 : Modality := Modality.definition

def modalitySection1028a : Modality := Modality.prohibition

def modalitySection1028b : Modality := Modality.obligation

def modalitySection1028c : Modality := Modality.definition

def modalitySection1028d : Modality := Modality.definition

def modalitySection1028e : Modality := Modality.permission

def modalitySection1028f : Modality := Modality.prohibition

def modalitySection1028g : Modality := Modality.obligation

def modalitySection1028h : Modality := Modality.obligation

def modalitySection1028i : Modality := Modality.definition

def modalitySection1029a : Modality := Modality.prohibition

def modalitySection1029b : Modality := Modality.prohibition

def modalitySection1029c : Modality := Modality.obligation

def modalitySection1029dPower : Modality := Modality.power

def modalitySection1029dDuty : Modality := Modality.obligation

def modalitySection1029e : Modality := Modality.definition

def modalitySection1029f : Modality := Modality.permission

def modalitySection1029g : Modality := Modality.permission

def modalitySection1029h : Modality := Modality.prohibition

end Proving.USC.T18.Ch1Ch47.Recert2.Deontic
