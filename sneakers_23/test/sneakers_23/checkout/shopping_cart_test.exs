defmodule Sneakers23.Checkout.ShoppingCartTest do
  use Sneakers23.DataCase, async: false
  alias Sneakers23.Checkout.ShoppingCart

  setup do
    {:ok, %ShoppingCart{} = cart} =
      ShoppingCart.new()
      |> ShoppingCart.add_item(4)

    {:ok, %{cart: cart}}
  end

  describe "new/0" do
    test "creates a new ShoppingCart struct" do
      assert %ShoppingCart{items: []} == ShoppingCart.new()
    end
  end

  describe "add_item/2" do
    test "adds items to the cart", %{cart: cart} do
      assert {:ok, %ShoppingCart{items: [2, 4]}} ==
               ShoppingCart.add_item(cart, 2)
    end

    test "prevents adding duplicate items to the cart", %{cart: cart} do
      assert {:error, :duplicate_item} == ShoppingCart.add_item(cart, 4)
    end

    test "returns an error when not given a valid id" do
      assert {:error, :invalid_id} == ShoppingCart.add_item(ShoppingCart.new(), "1")
    end
  end

  describe "remove_item/2" do
    test "removes an item from the cart", %{cart: cart} do
      assert {:ok, %ShoppingCart{items: []}} == ShoppingCart.remove_item(cart, 4)
    end

    test "returns an error when the item isn't found", %{cart: cart} do
      assert {:error, :not_found} == ShoppingCart.remove_item(cart, 2)
    end

    test "returns an error when not given a valid id" do
      assert {:error, :invalid_id} == ShoppingCart.remove_item(ShoppingCart.new(), "1")
    end
  end

  describe "serialize and deserialize" do
    test "can correctly serialize and deserialize a cart", %{cart: cart} do
      {:ok, serialized} = ShoppingCart.serialize(cart)

      assert {:ok, %ShoppingCart{items: [4]}} ==
               ShoppingCart.deserialize(serialized)
    end
  end
end
