














import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Scienter

open Proving.USC.Common







inductive ScienterDemand where

  | requires (rung : MentalState)

  | unspecified
  deriving DecidableEq







inductive ScienterLocus where



  | s245b_forceConduct


  | s245b1_motive

  | s245b2_protectedClassMotive

  | s245b2_activityMotive



  | s245b3_targetSelection



  | s245b4_motive


  | s245b5_motive


  | s245b_resultEnhancement




  | s245a1_certification



  | s247a1_conduct

  | s247a1_religiousCharacterMotive


  | s247a2_conduct


  | s247b_commerceNexus

  | s247c_conduct


  | s247c_protectedClassMotive


  | s247d_resultEnhancement


  | s247e_certification



  | s248a1_conduct



  | s248a1_reproductiveServicesMotive




  | s248a2_conduct


  | s248a3_conduct



  | s248a3_facilityMotive

  | s248b_resultEnhancement


  | s248b_recidivism



  | s248c2_attorneyGeneralBelief


  | s248c3_stateAttorneyGeneralBelief
  deriving DecidableEq



def is245bBranch : ScienterLocus → Bool
  | .s245b1_motive => true
  | .s245b2_protectedClassMotive => true
  | .s245b2_activityMotive => true
  | .s245b3_targetSelection => true
  | .s245b4_motive => true
  | .s245b5_motive => true
  | _ => false

end Proving.USC.T18.Ch13.Reearn.Scienter
