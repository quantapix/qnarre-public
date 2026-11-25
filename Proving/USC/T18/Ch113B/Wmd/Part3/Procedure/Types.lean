










import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Procedure

open Proving.USC.Common


opaque SentencingRecord : Type


inductive State where

  | conductAlleged

  | jurisdictionEstablished

  | investigationOpened

  | prosecutionCommenced

  | adjudicated

  | sentenced
  deriving DecidableEq, Repr



inductive OffenderRole where
  | principal
  | coConspirator
  | accessoryAfterTheFact
  deriving DecidableEq, Repr




inductive Nexus2332a where


  | mailOrFacilityOfCommerceUsed


  | propertyUsedInOrAffectingCommerce


  | perpetratorTravelsInCommerce


  | offenseAffectsInterstateCommerce
  deriving DecidableEq, Repr



inductive Base2332a where


  | againstNationalAbroad


  | againstPersonOrPropertyInUS (nexus : Nexus2332a)


  | againstUnitedStatesProperty


  | againstForeignGovernmentPropertyInUS


  | nationalUsingAbroad
  deriving Repr



inductive Circumstance2332b where


  | mailOrFacilityOfCommerceUsed


  | offenseAffectsInterstateCommerce



  | victimIsUnitedStatesGovernmentOrOfficial



  | propertyOwnedPossessedOrLeasedByUnitedStates


  | committedInTerritorialSea


  | committedInSpecialMaritimeAndTerritorialJurisdiction
  deriving DecidableEq, Repr




inductive ConductClass where


  | killingOrDeathResulting

  | kidnapping

  | maiming


  | assaultWithDangerousWeaponOrSeriousBodilyInjury


  | destructionOfProperty

  | threat


  | attemptOrConspiracy (target : ConductClass)
  deriving Repr



inductive EnumeratedInvestigativeOffense where
  | section351e
  | section844e
  | section844f1
  | section956b
  | section1361
  | section1366b
  | section1366c
  | section1751e
  | section2152
  | section2156
  deriving DecidableEq, Repr



structure Transition where
  source : State
  target : State
  guard  : Prop

end Proving.USC.T18.Ch113B.Wmd.Part3.Procedure
