part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}
class ApplyJobFChangeIndexState extends ApplyJobState {}
class ApplyJobFChangeSelectionState extends ApplyJobState {}
class ShowDetailsLoadingState extends ApplyJobState {}
class ShowDetailsSuccessState extends ApplyJobState {
  JobDetailsModel jobsDetailsModel;
  ShowDetailsSuccessState({required this.jobsDetailsModel});
}
class ShowDetailsErrorState extends ApplyJobState {}


class ApplyJobLoadingState extends ApplyJobState {}
class ApplyJobSuccessState extends ApplyJobState {}
class ApplyJobErrorState extends ApplyJobState {}


class GetAppliedJobsSuccessState extends ApplyJobState {
  AppliedModel appliedModel;
  GetAppliedJobsSuccessState({required this.appliedModel});

}


