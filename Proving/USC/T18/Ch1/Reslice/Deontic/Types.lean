







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Deontic

open Proving.USC.Common (Person Entity ComplaintText)





inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq



inductive Chapter1Norm where


  | definitionSmtj7


  | powerPresidentGuano7_4


  | prohibitionTreatySupersession7_9


  | prohibitionApplyParagraph9ToSection3261aOffense7_9

  | definitionFinancialInstitution20


  | permissionSubstituteProof21a

  | definitionOfficialRepresentation21b

  | definitionCourtOfTheUnitedStates23

  | definitionFederalHealthCareOffense24a

  | definitionHealthCareBenefitProgram24b
  deriving DecidableEq






opaque Provision : Type




opaque Place : Type



opaque Offense : Type




opaque Property : Type


opaque Representation : Type


opaque Court : Type



opaque Program : Type






inductive SmtjGround where


  | highSeasOrUsVessel


  | greatLakesVessel



  | federalEnclave


  | guanoIsland


  | usAircraftInFlight


  | spaceVehicleInFlight


  | placeOutsideAnyNation



  | foreignVesselScheduledUsVoyage


  | usMissionPremises


  | usMissionResidences
  deriving DecidableEq




def SmtjGround.requiresNationalityNexus : SmtjGround → Prop
  | .placeOutsideAnyNation
  | .foreignVesselScheduledUsVoyage
  | .usMissionPremises
  | .usMissionResidences => True
  | _ => False




def SmtjGround.isParagraph9 : SmtjGround → Prop
  | .usMissionPremises | .usMissionResidences => True
  | _ => False


inductive FinancialInstitutionCategory where

  | insuredDepositoryInstitution


  | insuredCreditUnion


  | federalHomeLoanBankOrMember


  | farmCreditSystemInstitution


  | smallBusinessInvestmentCompany

  | depositoryInstitutionHoldingCompany


  | federalReserveBankOrMemberBank


  | federalReserveActSection25Organization


  | foreignBankBranchOrAgency


  | mortgageLendingBusinessOrFederallyRelatedLender
  deriving DecidableEq


inductive TerritorialDistrictCourt where

  | guam

  | northernMarianaIslands

  | virginIslands
  deriving DecidableEq


inductive FederalHealthCareOffenseBranch where


  | unconditional




  | conditionalOnHealthCareRelation
  deriving DecidableEq

end Proving.USC.T18.Ch1.Reslice.Deontic
