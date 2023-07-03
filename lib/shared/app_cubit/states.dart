abstract class GymStates {}

class GymInitialState extends GymStates {}

class GymLoadingState extends GymStates {}

class GymChangeBottomNavBarState extends GymStates {}

class GymChangeProfileState extends GymStates {}

class GymChangeBottomRateState extends GymStates {}
class ChangeBottomAddPlanState extends GymStates {}

class ChangeBottomBranchState extends GymStates {}

class ProfileImagePickerSuccessState extends GymStates {}

class ProfileImagePickerErrorState extends GymStates {}

class  UploadProfileImageLoadingState extends GymStates {}

class UploadProfileImageSuccessState extends GymStates {}

class UploadProfileImageErrorState extends GymStates {}

class UserUpdateErrorState extends GymStates {}

class GetUserLoadingState extends GymStates {}

class GetUserSuccessState extends GymStates {}

class GetUserErrorState extends GymStates {
  final String error;

  GetUserErrorState({required this.error});
}
class GetCoachLoadingState extends GymStates {}

class GetCoachSuccessState extends GymStates {}

class GetCoachErrorState extends GymStates {
  final String error;

  GetCoachErrorState({required this.error});
}

class GetAllUserLoadingState extends GymStates {}

class GetAllUserSuccessState extends GymStates {}

class GetAllUserErrorState extends GymStates {
  final String error;

  GetAllUserErrorState(this.error);
}


class ChangeAppModeState extends GymStates {}


class ChangeBottomSheetState extends GymStates {
}
class GetOnlyMusclesLoading extends GymStates {}
class GetOnlyMusclesSuccess extends GymStates {}
class GetOnlyMusclesError extends GymStates {
  final String error;

  GetOnlyMusclesError({required this.error});
}

class AddPlanLoading extends GymStates {}
class AddPlanSuccess extends GymStates {}
class AddPlanError extends GymStates {
  final String error;

  AddPlanError({required this.error});
}
class  UpdatedRateLoadingState extends GymStates {}

class UpdatedRateSuccessState extends GymStates {}

class UpdatedRateErrorState extends GymStates {}


class GymChangeVisiblePasswordEditState extends GymStates {}
class GymChangeVisiblePasswordConfirmEditState extends GymStates {}

class UpdateUserPasswordLoadingState extends GymStates {}

class UpdateUserPasswordSuccessState extends GymStates {}

class UpdateUserPasswordErrorState extends GymStates {}