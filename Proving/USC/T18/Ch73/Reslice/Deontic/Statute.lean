









import Proving.USC.T18.Ch73.Reslice.Deontic.Types
import Proving.USC.T18.Ch73.Reslice.Deontic.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Deontic

open Proving.USC.Common












structure Defense1512e (p : Person) (c : ComplaintText) : Prop where
  lawfulConductOnly : AffirmativeDefenseLawfulTruthfulPersuasion1512e p c
  burdenCarried : DefendantCarriedPreponderanceBurden1512e p c



def Escape1512 (p : Person) (c : ComplaintText) : Prop :=
  Defense1512e p c ∨ LawfulBonaFideLegalRepresentation1515c p c





inductive ObstructiveIntent1512a1 (p : Person) (c : ComplaintText) : Prop where
  | proceeding (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (intent : IntentToPreventOrInfluenceTestimonyOrEvidence1512 p pr c)
  | communication (o : Person)
      (isOfficer : IsLawEnforcementOfficerOrJudge1515a4 o c)
      (intent : IntentToHinderLawEnforcementCommunication1512 p o c)


structure Prohibition1512a1 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c
  condition : ObstructiveIntent1512a1 p c



def Prohibition1512a1Violated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1512a1 p c ∧ KillsOrAttemptsToKill1512a1 p v c ∧ ¬ Escape1512 p c





inductive ObstructiveIntent1512a2b (p : Person) (c : ComplaintText) : Prop where
  | proceeding (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (intent : IntentToPreventOrInfluenceTestimonyOrEvidence1512 p pr c)
  | inducement (v : Person) (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (intent : IntentToInduceWitnessNoncompliance1512 p v pr c)
  | communication (o : Person)
      (isOfficer : IsLawEnforcementOfficerOrJudge1515a4 o c)
      (intent : IntentToHinderLawEnforcementCommunication1512 p o c)



structure Act1512a2 (p : Person) (v : Person) (c : ComplaintText) : Prop where
  conduct : UsesOrThreatensPhysicalForce1512a2 p v c
  qualifies : IsPhysicalForce1515a2 p v c


structure Prohibition1512a2 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c
  condition : ObstructiveIntent1512a2b p c


def Prohibition1512a2Violated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1512a2 p c ∧ Act1512a2 p v c ∧ ¬ Escape1512 p c





inductive Act1512b (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | intimidation (act : UsesIntimidationOrThreatens1512b p v c)
  | corruptPersuasion (act : CorruptlyPersuades1515a6 p v c)
      (notMerelyMissingStateOfMind : ¬ WouldBeMisleadingConductButForStateOfMind1515a6 p v c)
  | misleadingConduct (act : IsMisleadingConduct1515a3 p v c)


structure Prohibition1512b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c
  scienter : ActedKnowingly1512b p c
  condition : ObstructiveIntent1512a2b p c


def Prohibition1512bViolated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1512b p c ∧ Act1512b p v c ∧ ¬ Escape1512 p c




inductive Act1512c (p : Person) (c : ComplaintText) : Prop where
  | recordImpairment (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (act : CorruptlyAltersDestroysOrConceals1512c1 p pr c)
      (intent : IntentToImpairObjectIntegrity1512c1 p pr c)
  | otherObstruction (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (act : CorruptlyObstructsOfficialProceeding1512c2 p pr c)


structure Prohibition1512c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c
  scienter : ActedCorruptly1512c p c


def Prohibition1512cViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512c p c ∧ Act1512c p c ∧ ¬ Escape1512 p c





inductive ProtectedActivity1512d (v : Person) (c : ComplaintText) : Prop where
  | attendOrTestify (hindered : DissuadedFromAttendingOrTestifying1512d1 v c)
  | reportToLawEnforcement (hindered : DissuadedFromReportingToLawEnforcement1512d2 v c)
  | seekArrest (hindered : DissuadedFromSeekingArrest1512d3 v c)
  | causeProsecution (hindered : DissuadedFromCausingProsecution1512d4 v c)


structure Prohibition1512d (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c
  scienter : ActedIntentionally1512d p c



def Prohibition1512dViolated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1512d p c ∧ IntentionallyHarasses1512d p v c ∧
    HarassmentCausedDissuasion1512d p v c ∧ ProtectedActivity1512d v c ∧ ¬ Escape1512 p c




structure Prohibition1512k (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonSubjectToSection1512 p c


def Prohibition1512kViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1512k p c ∧ ConspiresToCommitSection1512Offense1512k p c ∧ ¬ Escape1512 p c




inductive Section1512Offense (p : Person) (c : ComplaintText) : Prop where
  | killing (v : Person) (violation : Prohibition1512a1Violated p v c)
  | force (v : Person) (violation : Prohibition1512a2Violated p v c)
  | tampering (v : Person) (violation : Prohibition1512bViolated p v c)
  | obstruction (violation : Prohibition1512cViolated p c)
  | harassment (v : Person) (violation : Prohibition1512dViolated p v c)
  | conspiracy (violation : Prohibition1512kViolated p c)





structure Power1512h (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesAsProsecutor1512 e c
  condition : Section1512Offense p c



def ExtraterritorialPowerHeld1512h (e : Entity) (p : Person) (c : ComplaintText) : Prop :=
  Power1512h e p c ∧ OffenseCommittedOutsideUnitedStates1512h p c




inductive VenueGround1512i (d : District) (p : Person) (c : ComplaintText) : Prop where
  | intendedProceeding (pr : OfficialProceeding)
      (isProceeding : IsOfficialProceeding1515a1 pr c)
      (ground : DistrictWhereProceedingIntendedToBeAffected1512i d pr c)
  | conductLocus (ground : DistrictWhereConductOccurred1512i d p c)



structure Permission1512i (e : Entity) (d : District) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesAsProsecutor1512 e c
  offense : Section1512Offense p c
  condition : VenueGround1512i d p c



def Permission1512iExercised (e : Entity) (d : District) (p : Person) (c : ComplaintText) : Prop :=
  Permission1512i e d p c ∧ ProsecutionBroughtInDistrict1512i e d c






structure Obligation1512j (e : Entity) (p : Person) (k : CriminalCase) (c : ComplaintText) : Prop where
  addressee : IsSentencingCourt1512j e c
  offense : Section1512Offense p c
  condition : OffenseOccurredInConnectionWithCriminalTrial1512j p k c


def Obligation1512jDischarged (e : Entity) (p : Person) (k : CriminalCase) (c : ComplaintText) : Prop :=
  Obligation1512j e p k c ∧ MaximumTermSetToHigherAlternative1512j e p k c




def Obligation1512jBreached (e : Entity) (p : Person) (k : CriminalCase) (c : ComplaintText) : Prop :=
  Obligation1512j e p k c ∧ ¬ MaximumTermSetToHigherAlternative1512j e p k c




def modality1512a1 : Modality := Modality.prohibition

def modality1512a2 : Modality := Modality.prohibition

def modality1512b : Modality := Modality.prohibition

def modality1512c : Modality := Modality.prohibition

def modality1512d : Modality := Modality.prohibition

def modality1512k : Modality := Modality.prohibition

def modality1512h : Modality := Modality.power

def modality1512i : Modality := Modality.permission

def modality1512j : Modality := Modality.obligation

def modality1515a : Modality := Modality.definition

def modality1515b : Modality := Modality.definition


def modality1515c : Modality := Modality.permission

end Proving.USC.T18.Ch73.Reslice.Deontic
