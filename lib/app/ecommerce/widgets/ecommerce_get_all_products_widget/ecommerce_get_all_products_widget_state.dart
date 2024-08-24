part of 'ecommerce_get_all_products_widget_cubit.dart';

@freezed
class EcommerceGetAllProductsWidgetState
    with _$EcommerceGetAllProductsWidgetState {
  const factory EcommerceGetAllProductsWidgetState.initial({
    GetAllProductsResponse? getAllProductsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllProductsStatus,
}) = _Initial;
}
