   M S B A M L   `   `   `  ����>  :dip, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:dip.pages	dip.pages  5   	       dip.pages.LogHistory   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:dip.pages     5   	     � Title$  
LogHistory��5   	   $	��450��6   $	��800��6)   .��5	      � ���#3A4750 � RowDefinitions 5
   
   �� 5      $
��auto �6   6,   �� 5      $��* �6   6)   �� 5      $��50 �6   6*   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ LoginHistoryDataGrid��5         AutoGenerateColumns .  $��1��6M   ���#3A4750   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *id+  5      $
 User��6%    63   �� *users.login+  5      $ LoginDateTime��6%    6<   �� *DateTimeLog+  5      $ TypeVxod��6%    67   �� *
TypeVhod+5      � 5   
    � Orientation$ Vertical=�6   $��2��6+   $
��Left=�68   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $	��175��6   ���#eeee	 �� TextAlignment$	 Center=�6;   0.Введите логин для поиска:6m   �� 5      -   5        $��SearchTextBox��5   &   $	��225��6   $��5q�6c   6p   5      �� 5      -   5        
 ��Name$
 SuccessCheckBox��5      $��2q�6x   ���#eeee$��Bottom=�6�   $?��9Показывть только удачные входы��6�   $
��Left=�6�   6�   �� 5      $ 
Horizontal=�6   .+�5      �� -   5        $��Сбросить��5      $��5q�6A   5       5"      �� 5#   
   -   5        $��2��5#   "   $	��Top=�6/   $��5q�6G   $��Right=�6R   .��6n   
Назад6u   5$      5%      