









import Proving.USC.T18.Ch113B.Remedy.Types
import Proving.USC.T18.Ch113B.Remedy.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Remedy

open Proving.USC.Common






structure Standing2333a (p : Person) (c : ComplaintText) : Prop where
  privateRight  : HasPrivateRightOfAction p c
  claimantClass : IsNationalOfTheUnitedStates p c
  injury        : InjuryCognizable p c
  predicateAct  : IsActOfInternationalTerrorism c
  causation     : CausedByViolation p c



structure DerivativeStanding2333a (p : Person) (q : Person) (c : ComplaintText) : Prop where
  injuredNational : Standing2333a q c
  relationship    : IsEstateSurvivorOrHeir p q c


inductive Claimant2333a (p : Person) (c : ComplaintText) : Prop where

  | direct (h : Standing2333a p c)

  | derivative (q : Person) (h : DerivativeStanding2333a p q c)







structure FtoPredicate2333d (o : ForeignTerroristOrganization) (c : ComplaintText) : Prop where
  designated  : OrganizationDesignatedForeignTerroristOrganization o c
  attribution : ActCommittedPlannedOrAuthorizedByOrganization o c




inductive SecondaryLiability2333d
    (d : Person) (o : ForeignTerroristOrganization) (c : ComplaintText) : Prop where

  | aidingAbetting (hp : FtoPredicate2333d o c)
      (h : AidsAndAbetsByKnowinglyProvidingSubstantialAssistance d c)

  | conspiracy (hp : FtoPredicate2333d o c)
      (h : ConspiresWithPersonCommittingAct d c)



inductive LiabilityTheory2333 (d : Person) (c : ComplaintText) : Prop where

  | primary (h : CommittedActOfInternationalTerrorism d c)

  | secondary (o : ForeignTerroristOrganization) (h : SecondaryLiability2333d d o c)




structure RemedyAvailable2333a (p : Person) (d : Person) (c : ComplaintText) : Prop where
  claimant        : Claimant2333a p c
  defendantLiable : LiabilityTheory2333 d c






structure Estoppel2333b (d : Person) (j : CriminalJudgment) (c : ComplaintText) : Prop where
  judgment      : PriorCriminalJudgmentForUnitedStates j c
  sameDefendant : DefendantWasDefendantInPriorProceeding d j c




structure Estoppel2333c (d : Person) (j : CriminalJudgment) (c : ComplaintText) : Prop where
  judgment          : PriorCriminalJudgmentForForeignState j c
  fullFaithAndCredit : AccordedFullFaithAndCredit j c
  sameDefendant     : DefendantWasDefendantInPriorProceeding d j c


inductive EstoppelAvailable2333
    (d : Person) (j : CriminalJudgment) (c : ComplaintText) : Prop where
  | unitedStates (h : Estoppel2333b d j c)
  | foreignState (h : Estoppel2333c d j c)






structure BlockedAssetExecution2333e
    (p : Person) (d : Person) (a : BlockedAsset) (c : ComplaintText) : Prop where
  judgment : HasObtainedJudgmentAgainstTerroristParty p d c
  blocked  : AssetSeizedOrFrozenUnderKingpinAct a d c













structure CriminalRemedy2332 (d : Person) (c : ComplaintText) : Prop where
  violation        : ViolatedSection2332 d c
  certification    : AttorneyGeneralCertificationFiled d c
  certifiedPurpose : OffenseIntendedToCoerceIntimidateOrRetaliate d c



structure CriminalRemedy2332a (d : Person) (c : ComplaintText) : Prop where
  violation : ViolatedSection2332a d c



structure CriminalRemedy2332b (d : Person) (c : ComplaintText) : Prop where
  violation    : ViolatedSection2332b d c
  jurisdiction : JurisdictionalNexusEstablished d c



structure CriminalRemedy2332d (d : Person) (c : ComplaintText) : Prop where
  violation : ViolatedSection2332d d c
  notExempt : ¬ TreasuryRegulationExemption d c



structure CriminalRemedy2332f (d : Person) (c : ComplaintText) : Prop where
  violation          : ViolatedSection2332f d c
  jurisdiction       : JurisdictionalNexusEstablished d c
  notArmedConflict   : ¬ ArmedForcesOrMilitaryForcesExclusion d c
  notNationalityOnly : ¬ NationalityOnlyDomesticOffenseExclusion d c



structure CriminalRemedy2332g (d : Person) (c : ComplaintText) : Prop where
  violation     : ViolatedSection2332g d c
  jurisdiction  : JurisdictionalNexusEstablished d c
  notAuthorized : ¬ UnitedStatesAuthorityOrContractExclusion d c



structure CriminalRemedy2332h (d : Person) (c : ComplaintText) : Prop where
  violation     : ViolatedSection2332h d c
  jurisdiction  : JurisdictionalNexusEstablished d c
  notAuthorized : ¬ UnitedStatesAuthorityOrContractExclusion d c



structure CriminalRemedy2332i (d : Person) (c : ComplaintText) : Prop where
  violation        : ViolatedSection2332i d c
  jurisdiction     : JurisdictionalNexusEstablished d c
  notArmedConflict : ¬ ArmedForcesOrMilitaryForcesExclusion d c




inductive DeathResultEnhancement (d : Person) (c : ComplaintText) : Prop where
  | s2332a (h : CriminalRemedy2332a d c) (hd : DeathResultedFromViolation d c)
  | s2332b (h : CriminalRemedy2332b d c) (hd : DeathResultedFromViolation d c)
  | s2332f (h : CriminalRemedy2332f d c) (hd : DeathResultedFromViolation d c)
  | s2332g (h : CriminalRemedy2332g d c) (hd : DeathResultedFromViolation d c)
  | s2332h (h : CriminalRemedy2332h d c) (hd : DeathResultedFromViolation d c)






structure InvestigativeAuthority2332b (d : Person) (c : ComplaintText) : Prop where
  federalCrimeOfTerrorism : IsFederalCrimeOfTerrorism d c




structure MilitaryAssistance2332e (c : ComplaintText) : Prop where
  emergency : EmergencyInvolvingWeaponOfMassDestruction c
  requested : MilitaryAssistanceRequestedByAttorneyGeneral c





def s2331Relief : List Relief := []




def s2332Enforcer : Enforcer := .criminal



def s2332Relief : List Relief := [.fine, .imprisonment, .deathPenalty]


def s2332aEnforcer : Enforcer := .criminal

def s2332aRelief : List Relief := [.imprisonment, .deathPenalty]



def s2332bEnforcer : Enforcer := .criminal


def s2332bRelief : List Relief :=
  [.imprisonment, .deathPenalty, .noProbation, .consecutiveSentence]



def s2332cRelief : List Relief := []


def s2332dEnforcer : Enforcer := .criminal

def s2332dRelief : List Relief := [.fine, .imprisonment]



def s2332eEnforcer : Enforcer := .agencyOnly


def s2332eRelief : List Relief := []


def s2332fEnforcer : Enforcer := .criminal

def s2332fRelief : List Relief := s2332aRelief


def s2332gEnforcer : Enforcer := .criminal



def s2332gRelief : List Relief := [.fine, .imprisonment, .mandatoryMinimum]


def s2332hEnforcer : Enforcer := .criminal

def s2332hRelief : List Relief := [.fine, .imprisonment, .mandatoryMinimum]


def s2332iEnforcer : Enforcer := .criminal


def s2332iRelief : List Relief := [.fine, .imprisonment]



def s2333aEnforcer : Enforcer := .privateRight


def s2333aRelief : List Relief := [.trebleDamages, .costs, .attorneysFees]



def s2333bRelief : List Relief := [.estoppel]

def s2333cRelief : List Relief := [.estoppel]


def s2333eRelief : List Relief := [.assetExecution]




def s2332a2MaximumYears : Nat := 10

def s2332a3MaximumYears : Nat := 3

def s2332b1MaximumYears : Nat := 20

def s2332cSubsecMaximumYears : Nat := 10

def s2332bMaimingMaximumYears : Nat := 35

def s2332bAssaultMaximumYears : Nat := 30

def s2332bPropertyMaximumYears : Nat := 25

def s2332bThreatMaximumYears : Nat := 10

def s2332dMaximumYears : Nat := 10

def maximumFineDollars : Nat := 2000000

def mandatoryMinimumYears : Nat := 25


def mandatoryMinimumYearsIfUsed : Nat := 30

end Proving.USC.T18.Ch113B.Remedy
