module Api
    module V1
        class PostsController < ApplicationController
            protect_from_forgery with: :null_session

            def index
                posts = Post.order('created_at DESC')
                render json: {status: 'success', message: 'Loaded posts', data: posts}, status: :ok
            end

            def show
                begin
                    post = Post.find(params[:id])
                    render json: {status: 'success', message: 'Loaded posts', data: post}, status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {status: 'error', message: e.to_s, data: post}, status: :not_found
                end

            end

            def create
                post = Post.new(post_params)
                if post.save
                    render json: {status: 'success', message: 'Saved post', data: post}, status: :ok
                else
                    render json: {status: 'error', message: 'Not save post', data: post.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                # begin
                    post = Post.find(params[:id])
                    begin
                        destroy_post = post.destroy
                        if destroy_post
                            render json: {status: 'success', message: 'Deleted post', data: post}, status: :ok
                        else
                            render json: {status: 'error', message: 'Can not delete post', data: post}, status: :not_found
                        end
                    rescue ActiveRecord::RecordNotDestroyed => e
                        render json: {status: 'error', message: e.to_s, data: post}, status: :not_found
                    end
                # rescue ActiveRecord::RecordNotFound => e
                #     render json: {status: 'error', message: e.to_s, data: post}, status: :not_found
                # end


            end

            def update
                begin
                    post = Post.find(params[:id])
                    if post.update_attributes(post_params)
                        render json: {status: 'success', message: 'Updated post', data: post}, status: :ok
                    else
                        render json: {status: 'error', message: 'Not update post', data: post.errors}, status: :unprocessable_entity
                    end
                rescue ActiveRecord::RecordNotFound => e
                    render json: {status: 'error', message: e.to_s, data: post}, status: :not_found
                end


            end

            private def post_params
                params.permit(:title, :body)
            end
        end
    end
end
