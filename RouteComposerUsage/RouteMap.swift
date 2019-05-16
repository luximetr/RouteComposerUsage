//
//  RouteMap.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/7/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class RouteMap {
  
  // MARK: - Start
  
  class var tutorialScreen: DestinationStep<TutorialVC, Any?> {
    return StepAssembly(
      finder: ClassFinder<TutorialVC, Any?>(),
      factory: InitVCFactory<TutorialVC, Any?>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(GeneralAction.replaceRoot())
      .from(GeneralStep.current())
      .assemble()
  }
  
  class var checkStateScreen: DestinationStep<CheckStateVC, Any?> {
    return StepAssembly(
      finder: ClassFinder<CheckStateVC, Any?>(),
      factory: InitVCFactory<CheckStateVC, Any?>())
      .using(UINavigationController.pushAsRoot())
      .from(tutorialScreen.expectingContainer())
      .assemble()
  }
  
  // MARK: - TabBar
  
  class var mainTabBarScreen: DestinationStep<MainTabBarController, MainTabBarContext> {
    return ContainerStepAssembly(
      finder: ClassFinder(),
      factory: CompleteFactoryAssembly(factory: NamedTabBarControllerFactory<MainTabBarController, MainTabBarContext>())
        .with(createDashboardWithNavigationFactory(), using: MainTabBarController.add())
        .with(createProfileWithNavigationFactory(), using: MainTabBarController.add())
        .with(createHistoryWithNavigationFactory(), using: MainTabBarController.add())
        .assemble())
      .using(GeneralAction.replaceRoot(animationOptions: .transitionCrossDissolve))
      .from(GeneralStep.current())
      .assemble()
  }
  
  private class func createDashboardWithNavigationFactory() -> CompleteFactory<NavigationControllerFactory<MainTabBarContext>> {
    return CompleteFactoryAssembly(
      factory: NavigationControllerFactory())
      .with(InitVCFactory<DashboardVC, MainTabBarContext>(), using: UINavigationController.push())
      .adding(ContextSettingTask())
      .assemble()
  }
  
  private class func createProfileWithNavigationFactory() -> CompleteFactory<NavigationControllerFactory<MainTabBarContext>> {
    return CompleteFactoryAssembly(
      factory: NavigationControllerFactory())
      .with(InitVCFactory<ProfileVC, MainTabBarContext>(), using: UINavigationController.push())
      .adding(ContextSettingTask())
      .assemble()
  }
  
  private class func createHistoryWithNavigationFactory() -> CompleteFactory<NavigationControllerFactory<MainTabBarContext>> {
    return CompleteFactoryAssembly(
      factory: NavigationControllerFactory())
      .with(HistoryScreenFactory(), using: UINavigationController.push())
      .assemble()
  }
  
  // MARK: - Side menu
  
  class var sideMenuScreen: DestinationStep<SideMenuController, MainTabBarContext> {
    return ContainerStepAssembly(
      finder: ClassFinder(),
      factory: CompleteFactoryAssembly(factory: SideMenuControllerFactory<SideMenuController, MainTabBarContext>.init(menuItemsListVCFactory: SimpleMenuItemsVCFactory(), menuItemsListVCContext: MainTabBarContext()))
        .with(createDashboardWithNavigationFactory(), using: SideMenuController.add())
        .with(createProfileWithNavigationFactory(), using: SideMenuController.add())
        .with(createHistoryWithNavigationFactory(), using: SideMenuController.add())
        .assemble())
      .using(GeneralAction.replaceRoot(animationOptions: .transitionCrossDissolve))
      .from(GeneralStep.current())
      .assemble()
  }
  
  class var dashboardScreen: DestinationStep<DashboardVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<DashboardVC, MainTabBarContext>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(SideMenuController.add())
      .from(sideMenuScreen)
      .assemble()
  }
  
  class var profileScreen: DestinationStep<ProfileVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<ProfileVC, MainTabBarContext>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(SideMenuController.add(at: 1, replacing: true))
      .from(sideMenuScreen)
      .assemble()
  }
  
  class var historyScreen: DestinationStep<HistoryVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: HistoryScreenFactory())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(SideMenuController.add())
      .from(sideMenuScreen)
      .assemble()
  }
  
  // MARK: - Consultation flow
  
  class var specializationScreen: DestinationStep<SpecializationVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<SpecializationVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.push())
      .from(dashboardScreen.expectingContainer())
      .assemble()
  }
  
  class var tariffSelectScreen: DestinationStep<TariffSelectVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<TariffSelectVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.push())
      .from(specializationScreen.expectingContainer())
      .assemble()
  }
  
  class var paymentCardsScreen: DestinationStep<PaymentCardsVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<PaymentCardsVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .adding(AuthorizationInterceptor())
      .using(UINavigationController.push())
      .from(tariffSelectScreen.expectingContainer())
      .assemble()
  }
  
  class var consultationReasonScreen: DestinationStep<ConsultationReasonVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<ConsultationReasonVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.push())
      .from(paymentCardsScreen.expectingContainer())
      .assemble()
  }
  
  // MARK: - Profile
  
  class var profileEditingScreen: DestinationStep<ProfileEditingVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<ProfileEditingVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.push())
      .from(profileScreen.expectingContainer())
      .assemble()
  }
  
  class var profileSettingsScreen: DestinationStep<ProfileSettingsVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<ProfileSettingsVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.push())
      .from(profileEditingScreen.expectingContainer())
      .assemble()
  }
  
  class var profileSettingsPushScreen: DestinationStep<ProfileSettingsVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<ProfileSettingsVC, MainTabBarContext>())
      .adding(ContextSettingTask())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(GeneralAction.presentModally())
      .from(GeneralStep.current())
      .assemble()
  }
  
  class var guestProfileScreen: DestinationStep<GuestProfileVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<GuestProfileVC, MainTabBarContext>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(MainTabBarController.add(at: 1, replacing: true))
      .from(mainTabBarScreen)
      .assemble()
  }
  
  class var guestProfileSettingsScreens: DestinationStep<GuestProfileSettingsVC, MainTabBarContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<GuestProfileSettingsVC, MainTabBarContext>())
      .using(UINavigationController.push())
      .from(guestProfileScreen.expectingContainer())
      .assemble()
  }
  
  // MARK: - Need update
  
  class var needUpdateScreen: DestinationStep<NeedUpdateVC, Any?> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: InitVCFactory<NeedUpdateVC, Any?>())
      .using(GeneralAction.replaceRoot())
      .from(GeneralStep.root())
      .assemble()
  }
  
  // MARK: - History
  
  class var historyDetailsScreen: DestinationStep<HistoryVC, MainTabBarContext> {
    return StepAssembly(
      finder: HistoryDetailsScreenFinder(),
      factory: HistoryDetailsScreenFactory())
      .using(UINavigationController.push())
      .from(historyScreen.expectingContainer())
      .assemble()
  }
}
