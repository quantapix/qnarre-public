







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Scienter

open Proving.USC.Common




inductive ProtectedClass
  | race
  | color
  | religion
  | nationalOrigin
  | ethnicCharacteristics
  deriving DecidableEq




inductive IntentObject


  | protectedFederalActivity


  | protectedStateOrPrivateActivity


  | nondiscriminatoryParticipation


  | aidingOrEncouragingParticipation

  | religiousCharacterOfProperty


  | freeExerciseOfReligion


  | reproductiveHealthServices


  | placeOfReligiousWorship
  deriving DecidableEq



def classes245b2 : List ProtectedClass :=
  [.race, .color, .religion, .nationalOrigin]



def classes247c : List ProtectedClass :=
  [.race, .color, .ethnicCharacteristics]

end Proving.USC.T18.Ch13.Reslice.Scienter
